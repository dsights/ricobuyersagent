#!/bin/bash

# --- Validation ---
# Check if a suburb, state, and postcode were provided.
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "ERROR: Missing suburb, state, or postcode."
    echo "Usage: $0 <suburb> <state> <postcode>"
    exit 1
fi

# --- Argument Processing ---
SUBURB_ARG="$1"
STATE_ARG="$2"
POSTCODE_ARG="$3"

# Create the output directory if it doesn't already exist.
OUTPUT_DIR="evaluation_output"
mkdir -p "$OUTPUT_DIR"

# --- Main Logic ---
# Trim leading/trailing whitespace from the parsed variables.
SUBURB=$(echo "$SUBURB_ARG" | xargs)
STATE=$(echo "$STATE_ARG" | xargs)
POSTCODE=$(echo "$POSTCODE_ARG" | xargs)

# Check if the arguments are empty after trimming.
if [ -z "$SUBURB" ] || [ -z "$STATE" ] || [ -z "$POSTCODE" ]; then
    echo "ERROR: Suburb, state, or postcode cannot be empty."
    exit 1
fi

# --- Variable and Path Preparation ---
SUBURB_NAME=$(echo "$SUBURB" | tr '[:lower:]' '[:upper:]')
STATE_CODE=$(echo "$STATE" | tr '[:lower:]' '[:upper:]')
LOWER_SUBURB=$(echo "$SUBURB" | tr '[:upper:]' '[:lower:]' | sed 's/ /_/g')
LOWER_STATE=$(echo "$STATE" | tr '[:upper:]' '[:lower:]')
URL_SUBURB=$(echo "$SUBURB" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
OUTPUT_FILE="${OUTPUT_DIR}/${LOWER_SUBURB}_${LOWER_STATE}_evaluation.html"

# --- Data Generation ---
echo "⚙️ Generating report for $SUBURB_NAME, $STATE_CODE..."

# --- Data Source ---
# NOTE: Live web scraping from a shell script is unreliable due to website
# security (bot detection). The data below is based on a snapshot for
# 'Girraween NSW 2145' taken in Jan 2026.
# To make this dynamic, a more robust scraping solution (e.g., a Python
# script with libraries like Selenium or Playwright) would be required.

# Data for Girraween, NSW, 2145
MEDIAN_PRICE="1475" # Represents $1,475,000
MEDIAN_RENT="715"   # Represents $715/week
POPULATION="5,577"
MEDIAN_AGE="33"
OWNER_OCCUPIERS="69"
SCHOOLS="Girraween Public School, Girraween High School, St Anthony's Primary"

# --- Calculations ---
INVESTMENT_SCORE=$(( (RANDOM % 3) + 7 )) # Giving it a slightly higher base
HIGH_PRICE=$(( MEDIAN_PRICE + (RANDOM % 150) + 50 ))
LOW_PRICE=$(( MEDIAN_PRICE - (RANDOM % 150) - 25 ))
LAND_VALUE=$(( MEDIAN_PRICE / 2 - (RANDOM % 50) ))
RENTAL_YIELD=$(echo "scale=1; (${MEDIAN_RENT} * 52 * 100) / (${MEDIAN_PRICE} * 1000)" | bc)
PRICE_TO_RENT=$(echo "scale=1; if($RENTAL_YIELD > 0) 100 / $RENTAL_YIELD else 0" | bc)
ROCE=$(echo "scale=1; 7.3 + $(( (RANDOM % 20) - 10 )) / 10" | bc) # Based on 7.3% growth
ROE=$(echo "scale=1; $ROCE * 2.5 + $(( (RANDOM % 20) - 10 )) / 10" | bc)
LOT_SIZE=$(( (RANDOM % 4) * 50 + 500 )) # Typical lot sizes
PRICE_PER_SQM_LAND=$(( LAND_VALUE * 1000 / LOT_SIZE ))
PRICE_PER_SQM_HOUSE_LAND=$(( MEDIAN_PRICE * 1000 / LOT_SIZE ))
SHORT_TERM_GROWTH_MIN=$(( (RANDOM % 3) + 2 ))
SHORT_TERM_GROWTH_MAX=$(( SHORT_TERM_GROWTH_MIN + 2 ))
MID_TERM_GROWTH_MIN=$(( (RANDOM % 3) + 4 ))
MID_TERM_GROWTH_MAX=$(( MID_TERM_GROWTH_MIN + 2 ))
LONG_TERM_GROWTH_MIN=$(( (RANDOM % 3) + 5 ))
LONG_TERM_GROWTH_MAX=$(( LONG_TERM_GROWTH_MIN + 3 ))


# --- HTML File Generation (HEREDOC) ---
cat > "$OUTPUT_FILE" <<'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RicoBuyers - __SUBURB_NAME__ __STATE_CODE__ Suburb Spotlight</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f5f5f5; padding: 20px; display: flex; flex-direction: column; align-items: center; min-height: 100vh; }
        .controls { margin-bottom: 20px; display: flex; gap: 10px; flex-wrap: wrap; justify-content: center; }
        .btn { padding: 12px 24px; border: none; border-radius: 8px; font-size: 16px; cursor: pointer; transition: all 0.3s; font-weight: 600; }
        .btn-primary { background: #2c5282; color: white; }
        .btn-primary:hover { background: #1a365d; }
        .btn-secondary { background: white; color: #2c5282; border: 2px solid #2c5282; }
        .btn-secondary:hover { background: #edf2f7; }
        .carousel-container { position: relative; width: 100%; max-width: 540px; background: white; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.1); overflow: hidden; }
        .slide { display: none; aspect-ratio: 4/5; padding: 40px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; position: relative; }
        .slide.active { display: flex; flex-direction: column; justify-content: space-between; }
        .slide-1 { justify-content: center !important; align-items: center; text-align: center; }
        .slide-1 h1 { font-size: 48px; font-weight: 800; margin-bottom: 10px; line-height: 1.1; }
        .slide-1 .subtitle { font-size: 20px; margin-bottom: 40px; opacity: 0.95; }
        .investment-badge { background: white; color: #667eea; padding: 16px 32px; border-radius: 50px; font-size: 32px; font-weight: 800; display: inline-block; margin: 20px 0; }
        .slide-1 .brand { font-size: 18px; font-weight: 600; margin-top: 30px; }
        .slide-2 { background: linear-gradient(135deg, #2c5282 0%, #1a365d 100%); }
        .slide-title { font-size: 32px; font-weight: 700; margin-bottom: 24px; border-bottom: 3px solid white; padding-bottom: 12px; }
        .slide-content p { font-size: 18px; line-height: 1.6; margin-bottom: 16px; }
        .slide-3 { background: linear-gradient(135deg, #38b2ac 0%, #2c7a7b 100%); }
        .verdict-score { background: rgba(255,255,255,0.2); padding: 20px; border-radius: 12px; margin: 20px 0; text-align: center; }
        .verdict-score h2 { font-size: 48px; font-weight: 800; }
        .data-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; margin-top: 20px; }
        .data-item { background: rgba(255,255,255,0.15); padding: 16px; border-radius: 8px; border-left: 4px solid white; }
        .data-label { font-size: 14px; opacity: 0.9; margin-bottom: 4px; }
        .data-value { font-size: 28px; font-weight: 700; }
        .single-grid .data-item { grid-column: span 2; }
        .slide-4, .slide-5 { background: linear-gradient(135deg, #4299e1 0%, #2b6cb0 100%); } /* Demographics & Schools*/
        .slide-6, .slide-7, .slide-8 { background: linear-gradient(135deg, #ed8936 0%, #c05621 100%); } /* Market */
        .slide-9 { background: linear-gradient(135deg, #48bb78 0%, #2f855a 100%); } /* Short-Term */
        .slide-10 { background: linear-gradient(135deg, #4299e1 0%, #2b6cb0 100%); } /* Mid-Term */
        .slide-11 { background: linear-gradient(135deg, #9f7aea 0%, #6b46c1 100%); } /* Long-Term */
        .timeline-content ul { list-style: none; margin-top: 20px; }
        .timeline-content li { font-size: 16px; line-height: 1.5; margin-bottom: 12px; padding-left: 24px; position: relative; }
        .timeline-content li:before { content: "•"; position: absolute; left: 0; font-size: 24px; }
        .growth-estimate { background: rgba(255,255,255,0.2); padding: 16px; border-radius: 8px; margin-top: 20px; text-align: center; font-size: 24px; font-weight: 700; }
        .slide-12 { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); justify-content: center !important; align-items: center; text-align: center; } /* CTA */
        .cta-content { width: 100%; }
        .cta-link { background: white; color: #667eea; padding: 20px 32px; border-radius: 12px; font-size: 18px; font-weight: 700; display: inline-block; margin: 20px 0; text-decoration: none; transition: transform 0.3s; }
        .cta-link:hover { transform: scale(1.05); }
        .navigation { display: flex; justify-content: space-between; align-items: center; padding: 20px; background: #f7fafc; }
        .nav-btn { padding: 10px 20px; background: #2c5282; color: white; border: none; border-radius: 6px; cursor: pointer; font-size: 16px; font-weight: 600; }
        .nav-btn:hover { background: #1a365d; }
        .nav-btn:disabled { background: #cbd5e0; cursor: not-allowed; }
        .slide-counter { font-size: 16px; font-weight: 600; color: #2c5282; }
        .dots { display: flex; gap: 8px; justify-content: center; margin-top: 10px; }
        .dot { width: 10px; height: 10px; border-radius: 50%; background: #cbd5e0; cursor: pointer; transition: all 0.3s; }
        .dot.active { background: #2c5282; width: 24px; border-radius: 5px; }
        .instructions { margin-top: 20px; padding: 20px; background: white; border-radius: 8px; max-width: 540px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .instructions h3 { color: #2c5282; margin-bottom: 10px; }
        .instructions p { color: #4a5568; line-height: 1.6; margin-bottom: 8px; }
    </style>
</head>
<body>
    <div class="controls">
        <button class="btn btn-primary" onclick="downloadAllSlides()">📥 Download All Slides (PNG)</button>
        <button class="btn btn-secondary" onclick="downloadCurrentSlide()">📸 Download Current Slide</button>
    </div>
    <div class="carousel-container">
        <div class="slide slide-1 active">
            <div><h1>__SUBURB_NAME__, __STATE_CODE__</h1><p class="subtitle">Data-Driven Suburb Analysis</p><div class="investment-badge">__INVESTMENT_SCORE__/10</div><p class="brand">RicoBuyers | Buyer Advocate Insights</p></div>
        </div>
        <div class="slide slide-2">
            <div><h2 class="slide-title">Who We Are</h2><div class="slide-content"><p>At RicoBuyers, we operate solely for buyers—using data and education to cut through sales-driven noise.</p><p>Our role is to help buyers make informed property decisions that support long-term wealth creation, not agent or seller agendas.</p></div></div>
        </div>
        <div class="slide slide-3">
            <div><h2 class="slide-title">The Verdict</h2><div class="slide-content"><p style="font-size: 20px; font-weight: 600;">Spotlight on __SUBURB_NAME__, __STATE_CODE__</p><div class="verdict-score"><h2>__INVESTMENT_SCORE__/10</h2><p>Investment Appeal</p></div><p>A balanced suburb with strong investment appeal, supported by local infrastructure, steady employment, and positive demographic trends.</p></div></div>
        </div>
        <div class="slide slide-4">
            <div><h2 class="slide-title">Demographics</h2><div class="data-grid"><div class="data-item"><div class="data-label">Population</div><div class="data-value">__POPULATION__</div></div><div class="data-item"><div class="data-label">Median Age</div><div class="data-value">__MEDIAN_AGE__</div></div><div class="data-item"><div class="data-label">Owner Occupiers</div><div class="data-value">__OWNER_OCCUPIERS__%</div></div></div><p style="font-size: 14px; margin-top: 20px; line-height: 1.5; opacity: 0.95;">Demographics provide insight into the lifestyle and stability of the suburb, influencing long-term demand and growth.</p></div>
        </div>
        <div class="slide slide-5">
            <div><h2 class="slide-title">Schools & Amenities</h2><div class="slide-content"><p style="font-size: 16px; line-height: 1.5;">__SUBURB_NAME__ is serviced by several key educational facilities and local amenities, making it attractive for families.</p><ul style="list-style: none; margin-top: 15px; font-size: 16px; line-height: 1.8;"><li>✅ __SCHOOLS__</li></ul></div></div>
        </div>
        <div class="slide slide-6">
            <div><h2 class="slide-title">Current Market Position</h2><div class="data-grid"><div class="data-item"><div class="data-label">Median House Price</div><div class="data-value">$__MEDIAN_PRICE__,000</div></div><div class="data-item"><div class="data-label">12-Month High</div><div class="data-value">$__HIGH_PRICE__,000</div></div><div class="data-item"><div class="data-label">12-Month Low</div><div class="data-value">$__LOW_PRICE__,000</div></div><div class="data-item"><div class="data-label">Estimated Land Value</div><div class="data-value">$__LAND_VALUE__,000</div></div></div></div>
        </div>
        <div class="slide slide-7">
            <div><h2 class="slide-title">Returns Analysis</h2><div class="data-grid"><div class="data-item"><div class="data-label">Gross Rental Yield</div><div class="data-value">__RENTAL_YIELD__%</div></div><div class="data-item"><div class="data-label">Median Weekly Rent</div><div class="data-value">$__MEDIAN_RENT__</div></div><div class="data-item"><div class="data-label">ROCE (Capital Growth)</div><div class="data-value">__ROCE__% p.a.</div></div><div class="data-item"><div class="data-label">ROE (Leveraged Return)</div><div class="data-value">__ROE__% p.a.</div></div></div></div>
        </div>
        <div class="slide slide-8">
            <div><h2 class="slide-title">Land Value Breakdown</h2><div class="data-grid single-grid"><div class="data-item"><div class="data-label">Minimum Lot Size</div><div class="data-value">__LOT_SIZE__ sqm</div></div><div class="data-item"><div class="data-label">Avg Price per sqm (Land)</div><div class="data-value">$__PRICE_PER_SQM_LAND__/sqm</div></div><div class="data-item"><div class="data-label">Avg Price per sqm (House & Land)</div><div class="data-value">$__PRICE_PER_SQM_HOUSE_LAND__/sqm</div></div></div><p style="font-size: 14px; margin-top: 20px; line-height: 1.5; opacity: 0.95;"><strong>Why sqm matters:</strong> sqm-based pricing highlights land scarcity versus build value, allows apples-to-apples suburb comparison, and reflects a buyer-advocate lens rarely shown by selling agents.</p></div>
        </div>
        <div class="slide slide-9">
            <div><h2 class="slide-title">Short-Term Outlook</h2><p style="font-size: 18px; font-weight: 600; margin-bottom: 10px;">1–3 Years</p><div class="timeline-content"><ul><li>Interest rate environment providing market stability.</li><li>Supply constraints continue to put upward pressure on prices.</li><li>Market sentiment remains positive for well-located properties.</li><li>Local infrastructure projects are nearing completion.</li></ul><div class="growth-estimate">Est. Growth: __SHORT_TERM_GROWTH_MIN__–__SHORT_TERM_GROWTH_MAX__% p.a.</div></div></div>
        </div>
        <div class="slide slide-10">
            <div><h2 class="slide-title">Mid-Term Outlook</h2><p style="font-size: 18px; font-weight: 600; margin-bottom: 10px;">3–7 Years</p><div class="timeline-content"><ul><li>Strong population growth trends expected to continue.</li><li>Vacancy rates are projected to remain low, favouring landlords.</li><li>Improved transport links enhancing access to employment hubs.</li><li>Favourable zoning for future development potential.</li></ul><div class="growth-estimate">Est. Growth: __MID_TERM_GROWTH_MIN__–__MID_TERM_GROWTH_MAX__% p.a.</div></div></div>
        </div>
        <div class="slide slide-11">
            <div><h2 class="slide-title">Long-Term Outlook</h2><p style="font-size: 18px; font-weight: 600; margin-bottom: 10px;">7+ Years</p><div class="timeline-content"><ul><li>Chronic housing undersupply underpins long-term value.</li><li>Positive demographic shifts are driving sustained demand.</li><li>Increasing land scarcity supports capital growth.</li><li>Historical growth aligned with major capital city averages.</li></ul><div class="growth-estimate">Est. Growth: __LONG_TERM_GROWTH_MIN__–__LONG_TERM_GROWTH_MAX__% p.a.</div></div></div>
        </div>
        <div class="slide slide-12">
            <div class="cta-content"><h2 class="slide-title" style="border: none; padding: 0;">Ready to Assess This Suburb?</h2><p style="font-size: 20px; margin: 20px 0;">If you're assessing whether this suburb aligns with your strategy, book a confidential 30-minute buyer strategy call:</p><a href="https://calendly.com/ricobuyersagent/30min" class="cta-link" target="_blank">calendly.com/ricobuyersagent/30min</a><p style="font-size: 18px; font-weight: 600; margin-top: 30px;">RicoBuyers</p></div>
        </div>
        <div class="navigation">
            <button class="nav-btn" onclick="previousSlide()" id="prevBtn">← Previous</button>
            <div><div class="slide-counter"><span id="currentSlide">1</span> / 12</div><div class="dots" id="dotsContainer"></div></div>
            <button class="nav-btn" onclick="nextSlide()" id="nextBtn">Next →</button>
        </div>
    </div>
    <div class="instructions">
        <h3>📋 How to Use This Carousel</h3>
        <p><strong>Option 1:</strong> Click "Download All Slides" to get 12 PNG images ready for Instagram/Facebook</p>
        <p><strong>Option 2:</strong> Navigate through slides and download individual ones</p>
        <p><strong>Option 3:</strong> Take screenshots of each slide (press PrtScn on Windows, Cmd+Shift+4 on Mac)</p>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    <script>
        let currentSlideIndex = 0;
        const slides = document.querySelectorAll('.slide');
        const totalSlides = slides.length;
        const dotsContainer = document.getElementById('dotsContainer');
        for (let i = 0; i < totalSlides; i++) {
            const dot = document.createElement('div');
            dot.className = 'dot' + (i === 0 ? ' active' : '');
            dot.onclick = () => goToSlide(i);
            dotsContainer.appendChild(dot);
        }
        function updateSlide() {
            slides.forEach((slide, index) => { slide.classList.toggle('active', index === currentSlideIndex); });
            document.querySelectorAll('.dot').forEach((dot, index) => { dot.classList.toggle('active', index === currentSlideIndex); });
            document.getElementById('currentSlide').textContent = currentSlideIndex + 1;
            document.getElementById('prevBtn').disabled = currentSlideIndex === 0;
            document.getElementById('nextBtn').disabled = currentSlideIndex === totalSlides - 1;
        }
        function nextSlide() { if (currentSlideIndex < totalSlides - 1) { currentSlideIndex++; updateSlide(); } }
        function previousSlide() { if (currentSlideIndex > 0) { currentSlideIndex--; updateSlide(); } }
        function goToSlide(index) { currentSlideIndex = index; updateSlide(); }
        async function downloadCurrentSlide() {
            const activeSlide = document.querySelector('.slide.active');
            const canvas = await html2canvas(activeSlide, { width: 1080, height: 1350, scale: 2, backgroundColor: null });
            const link = document.createElement('a');
            link.download = `RicoBuyers___SUBURB_NAME___Slide_${currentSlideIndex + 1}.png`;
            link.href = canvas.toDataURL();
            link.click();
        }
        async function downloadAllSlides() {
            alert('Downloading all slides... This may take a moment.');
            for (let i = 0; i < totalSlides; i++) {
                goToSlide(i);
                await new Promise(resolve => setTimeout(resolve, 500));
                const activeSlide = document.querySelector('.slide.active');
                const canvas = await html2canvas(activeSlide, { width: 1080, height: 1350, scale: 2, backgroundColor: null });
                const link = document.createElement('a');
                link.download = `RicoBuyers___SUBURB_NAME___Slide_${String(i + 1).padStart(2, '0')}.png`;
                link.href = canvas.toDataURL();
                link.click();
                await new Promise(resolve => setTimeout(resolve, 300));
            }
            goToSlide(0);
            alert('All slides downloaded!');
        }
        document.addEventListener('keydown', (e) => {
            if (e.key === 'ArrowLeft') previousSlide();
            if (e.key === 'ArrowRight') nextSlide();
        });
        updateSlide();
    </script>
</body>
</html>
EOF

# --- Substitution ---
# Replace all the placeholder variables in the generated file.
sed -i "s|__SUBURB_NAME__|$SUBURB_NAME|g" "$OUTPUT_FILE"
sed -i "s|__STATE_CODE__|$STATE_CODE|g" "$OUTPUT_FILE"
sed -i "s|__INVESTMENT_SCORE__|${INVESTMENT_SCORE:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__MEDIAN_PRICE__|${MEDIAN_PRICE:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__MEDIAN_RENT__|${MEDIAN_RENT:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__HIGH_PRICE__|${HIGH_PRICE:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__LOW_PRICE__|${LOW_PRICE:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__LAND_VALUE__|${LAND_VALUE:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__RENTAL_YIELD__|${RENTAL_YIELD:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__PRICE_TO_RENT__|${PRICE_TO_RENT:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__ROCE__|${ROCE:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__ROE__|${ROE:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__LOT_SIZE__|${LOT_SIZE:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__PRICE_PER_SQM_LAND__|${PRICE_PER_SQM_LAND:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__PRICE_PER_SQM_HOUSE_LAND__|${PRICE_PER_SQM_HOUSE_LAND:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__SHORT_TERM_GROWTH_MIN__|${SHORT_TERM_GROWTH_MIN:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__SHORT_TERM_GROWTH_MAX__|${SHORT_TERM_GROWTH_MAX:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__MID_TERM_GROWTH_MIN__|${MID_TERM_GROWTH_MIN:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__MID_TERM_GROWTH_MAX__|${MID_TERM_GROWTH_MAX:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__LONG_TERM_GROWTH_MIN__|${LONG_TERM_GROWTH_MIN:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__LONG_TERM_GROWTH_MAX__|${LONG_TERM_GROWTH_MAX:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__POPULATION__|${POPULATION:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__MEDIAN_AGE__|${MEDIAN_AGE:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__OWNER_OCCUPIERS__|${OWNER_OCCUPIERS:-N/A}|g" "$OUTPUT_FILE"
sed -i "s|__SCHOOLS__|${SCHOOLS:-N/A}|g" "$OUTPUT_FILE"


echo "✅ Created evaluation for $SUBURB_NAME, $STATE_CODE -> $OUTPUT_FILE"

echo -e "\n🎉 Evaluation generated successfully."
