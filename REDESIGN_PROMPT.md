# RICO Buyers Agent — Complete Website Redesign Prompt

---

## ROLE

You are a senior full-stack web developer and UI/UX designer specialising in high-conversion real estate and financial services websites. You have deep expertise in modern frontend frameworks, real estate buyer-advocate platforms, international property investor UX, and performance-optimised static site development.

---

## PROJECT OVERVIEW

**Client:** RICO Buyers Agent (RBA)
**Website:** ricobuyersagent.au
**Contact:** contact@ricobuyersagent.au | WhatsApp +61414711771
**Booking:** calendly.com/ricobuyersagent/30min
**Service area:** All of Australia (with a growing international client base)

**Business type:** Independent buyers agency — works exclusively for property buyers, not sellers. Provides end-to-end buyer representation: property sourcing (including off-market), due diligence, negotiation, auction bidding, and post-purchase property management coordination.

**Target audiences:**
1. Australian first home buyers
2. Australian property investors (from first portfolio to multi-property)
3. Owner-occupiers relocating or upgrading
4. **International clients** (expat Australians, overseas investors buying Australian property — key growth segment)

**The core brand proposition:** RICO works only for the buyer. No agent conflicts, data-driven decisions, off-market access, expert negotiation.

---

## CURRENT SITE AUDIT — WHAT EXISTS

The existing site was built with **Mobirise v5.6.13** (a drag-and-drop builder) and has significant limitations. The redesign must be a **ground-up rebuild** in clean, hand-coded HTML/CSS/JS (or a modern static framework like Next.js/Astro). Do NOT use Mobirise.

### Existing pages to migrate and improve:
- `index.html` — Homepage
- `calculators.html` — Calculator hub (stamp duty, borrowing power, land tax, buying costs)
- `cashflow-calculator.html` — Investment property cash flow calculator
- `mortgage-calculator.html` — Mortgage repayment calculator
- `find-property.html` — Step-by-step property search wizard
- `privacy-policy.html`
- 11 blog/article pages (Market Pulse)

### Existing features to retain and enhance:
- WhatsApp floating chat button (+61414711771)
- Tidio live chat widget (code: `//code.tidio.co/uzhcraxyyb0lddvv2qb8zp2tjhi6tzea.js`)
- Calendly FREE CONSULTATION booking button
- FAQ accordion
- Testimonials section
- Blog/Market Pulse section
- Financial calculators (all to be rebuilt as modern interactive tools)
- Footer contact form

### Current pain points to fix:
- No scroll animations or micro-interactions
- No dedicated About / Team page
- No dedicated Services page
- No stats/social-proof trust bar
- No international client section or content
- No suburb analysis interactive tool
- No currency converter for international buyers
- Testimonials are text-only with no photos, names or star ratings
- Blog posts are standalone HTML files with no shared template
- Copyright still shows 2023
- No schema.org structured data (LocalBusiness, FAQPage, etc.)
- No sitemap beyond the basic one
- Mobile experience is passable but not best-in-class
- No sticky CTA bar for mobile
- Form sends via Mobirise's server (replace with a reliable solution)

---

## BRAND IDENTITY — MUST REMAIN CONSISTENT

### Colour Palette

| Token | Hex | Usage |
|---|---|---|
| `--color-primary` | `#2c5282` | Navy blue — primary brand, CTAs, headings, links |
| `--color-primary-dark` | `#1a365d` | Darker navy — hover states, section backgrounds |
| `--color-primary-light` | `#4a7fc1` | Lighter navy — accents, icon fills |
| `--color-teal` | `#39847a` | Secondary accent — badges, highlights, success states |
| `--color-teal-dark` | `#2c7a7b` | Teal dark variant |
| `--color-gold` | `#bda08a` | Warm sand/gold — hero overlays, luxury accent |
| `--color-white` | `#ffffff` | Base white |
| `--color-light` | `#f7f9fc` | Section background light |
| `--color-dark` | `#1a1a2e` | Deep dark — footer, dark sections |
| `--color-text` | `#2d3748` | Body text |
| `--color-text-muted` | `#718096` | Secondary text |

### Typography

| Role | Font | Weight |
|---|---|---|
| Display headings | Poppins | 700, 800 |
| Body headings | Poppins | 600 |
| Body text | Inter (replace Roboto) | 400, 500 |
| Captions/labels | Inter | 400 |

### Logo
Use existing logo files:
- `assets/images/rba-logo-154x95.jpg` (light backgrounds)
- `assets/images/rba-logo-transparent-128x161.png` (dark backgrounds)

---

## TECH STACK

**Framework options (choose one):**
- **Preferred:** Vanilla HTML5 + CSS custom properties + vanilla JS (keeps it easy to deploy to GitHub Pages / Cloudflare Pages, no build step)
- **Alternative:** Astro (static-first, excellent performance, component-based)

**Libraries to include (CDN-loaded, no npm required for vanilla option):**
- AOS (Animate On Scroll) v2 — scroll-triggered animations
- GSAP (GreenSock) — hero animations, counter animations
- Swiper.js — carousels and sliders
- Chart.js — calculator visualisations
- Leaflet.js — interactive suburb map (optional, load on demand)
- Alpine.js — lightweight reactivity for interactive components

**CSS approach:**
- CSS custom properties for all tokens
- Mobile-first responsive grid (CSS Grid + Flexbox, no Bootstrap dependency)
- Smooth scroll, focus-visible, reduced-motion media queries

**Performance targets:**
- Lighthouse Performance ≥ 90
- LCP < 2.5s
- CLS < 0.1
- All images: WebP format with JPEG fallback, lazy-loaded
- Critical CSS inlined, non-critical deferred

**Hosting:**
- GitHub Pages (current) via `.github/workflows/deploy.yml`
- No server-side logic — all forms via Formspree or Web3Forms (replace Mobirise form backend)

---

## SITE ARCHITECTURE — PAGE LIST

### New pages to create:
1. `index.html` — Homepage (full redesign)
2. `about.html` — About RICO / Our Story / Meet the Team
3. `services.html` — Services overview with packages/pricing transparency
4. `for-investors.html` — Dedicated investor landing page
5. `for-first-home-buyers.html` — Dedicated first home buyer landing page
6. `for-international-buyers.html` — **NEW: international client page** (expats, overseas investors)
7. `process.html` — How it Works (step-by-step buyer journey)
8. `suburb-insights.html` — Suburb analysis tool / market insights hub
9. `calculators.html` — Unified calculator hub (improved)
10. `find-property.html` — Property search wizard (improved)
11. `blog/index.html` — Blog listing page with filtering
12. `blog/[slug].html` — Individual blog post template (all 11 existing posts migrated)
13. `contact.html` — Dedicated contact page
14. `privacy-policy.html` — (migrated)
15. `sitemap.xml` — Updated
16. `robots.txt` — Updated

### Calculator sub-pages (keep existing paths):
- `cashflow-calculator.html` (improved)
- `mortgage-calculator.html` (improved)
- `stamp-duty-calculator.html` (new, extract from calculators hub)
- `borrowing-power-calculator.html` (new)

---

## PAGE-BY-PAGE SPECIFICATIONS

---

### 1. GLOBAL COMPONENTS

#### Navigation (sticky, transparent on hero → solid on scroll)
```
[Logo]   Home | Services | Process | Suburb Insights | Calculators | Blog | About
                                                     [📞 WhatsApp] [FREE CONSULTATION →]
```
- Mobile: hamburger → full-screen slide-in menu with gradient background
- Active state: primary colour underline
- Scroll behaviour: transparent with white text on hero, transitions to white background with dark text after 80px scroll (CSS transition, not JS jank)
- Dropdown for Services with sub-links: Investors | First Home Buyers | International Buyers | Owner Occupiers
- "FREE CONSULTATION" button: `--color-teal` background, white text, pill shape, subtle box-shadow, hover: scale(1.03)

#### Footer
Three-column layout:
- **Col 1:** Logo + tagline + social links (LinkedIn, Facebook, Instagram) + ASIC/REA licence disclaimer
- **Col 2:** Quick links (all main pages) + recent blog posts
- **Col 3:** Contact form (Formspree/Web3Forms) + address + phone + WhatsApp link + Calendly link
- Bottom bar: Copyright © 2025 RICO Buyers Agent · ABN · Privacy Policy · Terms

#### WhatsApp Floating Button
- Retain existing implementation (`assets/chatbutton/floating-wpp.js`)
- Position: bottom-right (move from bottom-left)
- Popup message: clean text, no emojis

#### Trust Bar (global, appears just below hero on homepage, appears in sticky header on scroll for inner pages)
```
200+ Properties Secured  |  $4.2M+ Saved for Clients  |  4.9★ Google Rating  |  100% Buyer-Only Focus
```
Animate numbers up with GSAP CountTo on scroll-into-view.

---

### 2. HOMEPAGE (`index.html`)

#### Section 1 — Hero (Full-screen, parallax)
- **Background:** Full-screen high-quality image of an Australian cityscape/property (use `assets/images/mbr-1920x1272.jpg` or similar) with a `--color-primary-dark` overlay at 65% opacity
- **Headline (H1):** "BUY YOUR NEXT PROPERTY WITH CONFIDENCE" — Poppins 800, white, 56-72px
- **Subheadline:** "Australia's dedicated buyer advocates — we work only for you, never the seller." — Inter 400, white 80% opacity, 20px
- **CTA buttons (two):**
  - Primary: "BOOK FREE CONSULTATION" → Calendly link — `--color-teal` pill button
  - Secondary: "HOW WE WORK" → anchors to process section — white outline pill button
- **GSAP animation:** headline words animate in staggered (each word fades + slides up, 0.1s stagger)
- **Scroll arrow:** animated bounce arrow below hero

#### Section 2 — Trust Stats Bar
Animated counters, 4 stats on navy background:
- `200+` Properties Secured
- `$4.2M+` Saved for Clients
- `15+` Years Combined Experience
- `4.9★` Average Client Rating

#### Section 3 — Who We Serve (3 cards)
Cards with hover lift animation:
1. **INVESTOR** — icon: chart-line — "Data-driven strategy for your first or tenth investment property"
2. **FIRST HOME BUYER** — icon: home — "Step-by-step guidance from search to settlement"
3. **INTERNATIONAL BUYER** — icon: globe — "Buy Australian property from anywhere in the world" ← **NEW**
4. **OWNER OCCUPIER** — icon: family — "Find the perfect home in an area you know or don't"

On hover: card lifts (translateY -8px), border-top accent in `--color-teal`.

#### Section 4 — The RICO Advantage (alternating image-text rows)
Three feature rows with subtle entrance animation (AOS fade-right / fade-left):
1. **Expert Property Sourcing** — "Access off-market and pre-market listings others never see. Our network of 1,000+ agents means you're first in line."
2. **Data-Driven Strategy** — "Every recommendation is backed by suburb-level analytics, rental yield data, growth trajectories, and comparative market analysis."
3. **Skilled Negotiation** — "Our buyer advocates have negotiated $X below asking on average. We remove emotion and bring leverage."

Each row: text on one side, styled metric card or image on the other.

#### Section 5 — How It Works (horizontal step timeline)
6-step process with connecting animated line (drawn on scroll using GSAP):
1. Strategy Session (free) — Calendly
2. Property Brief & Criteria
3. Market Research & Sourcing
4. Due Diligence & Shortlisting
5. Negotiation & Auction
6. Settlement & Handover

On mobile: vertical timeline.

#### Section 6 — Suburb Insights Preview
Dark navy section with map preview + CTA:
"We analyse every Australian suburb so you don't have to."
- Feature grid: Median price trends | Rental yield data | Growth projections | Infrastructure pipeline | Demographic analysis
- CTA: "Explore Suburb Insights →" → `suburb-insights.html`

#### Section 7 — Testimonials Carousel (Swiper.js)
Star ratings + client photo (placeholder avatar) + quote + name + buyer type + location:
- "The Smiths" — First Time Buyers, Melbourne
- "John D." — Property Investor, Sydney
- "The Williams Family" — Relocating Family, Brisbane
- Add 2 more testimonials for international buyers and rentvesting clients
- Auto-play, pause on hover, dots navigation

#### Section 8 — Market Pulse / Blog Preview
3 latest articles in card grid with:
- Category tag badge
- Date
- Read time
- Title
- Excerpt
- "Read More →" link

#### Section 9 — Calculator Quick Access
3 calculator cards:
- Mortgage Repayment Calculator
- Investment Cash Flow Calculator
- Stamp Duty Calculator
Each with inline mini-form preview and "Calculate Now →" CTA.

#### Section 10 — CTA Banner
Full-width navy gradient:
"Ready to Buy Smarter?"
Subtext: "Book your free 30-minute strategy session. No obligation, no selling — just advice."
CTA: "BOOK FREE CONSULTATION" → Calendly

#### Section 11 — FAQ Accordion
Same 6 FAQs as current site, plus add:
- "Do you work with international buyers?"
- "What are your fees?"
- "How quickly can you find me a property?"

Schema.org FAQPage markup embedded.

---

### 3. ABOUT PAGE (`about.html`)

#### Hero
- Headline: "Who is RICO Buyers Agent?"
- Sub: "Born from frustration. Built for buyers."
- Background: Split-image with a professional photo of the team/office

#### Our Story
Narrative section (2-3 paragraphs). Use existing FAQ content as seed:
"RICO was founded with one belief: property buyers deserve the same level of expertise and representation that sellers have always had. For too long, the real estate industry has been designed in favour of vendors and listing agents. We flipped the script."

#### Values Grid (4 icons)
- Buyer-Only Focus (never a selling agent conflict)
- Data Over Emotion
- Education-First Advice
- Long-Term Wealth Creation

#### Credentials & Licences
- Relevant state real estate licences
- ASIC compliance note
- Member logos (REIV, REBAA or equivalent)

#### Team Section
Cards: Photo | Name | Title | Short bio | LinkedIn icon
(Placeholder structure — client fills in details)

#### CTA → Free Consultation

---

### 4. SERVICES PAGE (`services.html`)

#### Hero
Headline: "Services Designed for Buyers, Not Sellers"

#### Service Packages (3 cards with flip animation on hover)

**FULL SERVICE — END TO END**
Best for: Busy investors, interstate buyers, international buyers
Includes:
- Property brief consultation
- Full market research
- Off-market sourcing
- Inspections & due diligence
- Negotiation or auction bidding
- Post-purchase property management coordination

**NEGOTIATION ONLY**
Best for: Buyers who found the property, need help on price
Includes:
- Property assessment
- Market valuation report
- Price negotiation
- Contract review coordination

**AUCTION BIDDING**
Best for: Buyers attending auctions without experience
Includes:
- Pre-auction brief
- Auction day representation
- Post-auction negotiation if passed in

#### Why Not DIY? (comparison table)
| Feature | DIY Buyer | RICO Buyer |
|---|---|---|
| Access to off-market listings | ✗ | ✓ |
| Expert negotiation | ✗ | ✓ |
| Emotional decision risk | High | Eliminated |
| Time spent searching | 6-12 months avg | 4-8 weeks |
| Overpaying risk | High | Low |

#### CTA → Book Consultation

---

### 5. FOR INTERNATIONAL BUYERS PAGE (`for-international-buyers.html`) ← KEY NEW PAGE

This is a critical page for global appeal. Many expat Australians and foreign investors want to buy Australian property but can't be on the ground.

#### Hero
- Background: aerial view of Australian coastal/city property
- Headline: "Buying Australian Property From Anywhere in the World"
- Subheadline: "We are your eyes, ears and advocates on the ground — so you don't have to be."
- CTA: "Book a Free International Consultation" → Calendly

#### Section: Who Is This For?
3 cards:
- **Expat Australians** — "Living overseas, want to buy back home. We handle everything while you're away."
- **Foreign Investors** — "Attracted to Australia's stable property market. We navigate FIRB rules and source the right assets."
- **Returning Australians** — "Coming back to Australia and want to settle before you land."

#### Section: The Challenge of Buying Remotely
Pain point callouts (icon + short text):
- Can't inspect in person
- Unfamiliar with local suburbs
- Unsure of foreign buyer rules (FIRB)
- Time zone challenges
- Currency conversion complexity
- Legal and conveyancing complexity

#### Section: How RICO Solves It (step-by-step)
1. **Video consultation** — We meet via Zoom, understand your brief, budget and goals
2. **Digital property briefs** — Detailed suburb reports with photos, video walkthroughs, and data
3. **Remote due diligence** — Building inspections, pest reports, strata reports — all arranged by us
4. **Secure digital signing** — Contracts, powers of attorney, all managed remotely
5. **Settlement & handover** — Property managed post-settlement if needed

#### Section: FIRB & Foreign Buyer Rules
Educational content about:
- Foreign Investment Review Board (FIRB) process
- Application fees and timelines
- Which property types are eligible
- State-based rules
- Link: "We refer you to our trusted FIRB specialists"

#### Section: Currency Converter Widget
Embed a simple, lightweight currency converter using Open Exchange Rates (free tier) or Fixer.io:
- Default: show property prices in AUD, convert to USD, GBP, SGD, EUR, CAD, HKD, NZD
- Dropdowns for FROM/TO currency
- Auto-updating exchange rates (daily cache from API)
- Disclaimer: "Rates indicative only. Consult your bank or forex broker for transaction rates."

```html
<!-- Example structure -->
<div class="currency-converter">
  <div class="converter-input">
    <input type="number" id="amount" value="800000">
    <select id="from-currency">
      <option value="AUD" selected>AUD (A$)</option>
      ...
    </select>
  </div>
  <div class="converter-arrow">⇌</div>
  <div class="converter-output">
    <span id="converted-amount">--</span>
    <select id="to-currency">
      <option value="USD">USD ($)</option>
      <option value="GBP">GBP (£)</option>
      <option value="SGD">SGD (S$)</option>
      ...
    </select>
  </div>
</div>
```

#### Section: Testimonial from International Buyer
Dedicated quote from an overseas or expat client.

#### Section: FAQ for International Buyers
- "Can a foreign national buy residential property in Australia?"
- "What is FIRB and do I need approval?"
- "How do I sign contracts from overseas?"
- "Can you conduct video inspections for me?"
- "What are the additional stamp duty surcharges for foreign buyers?"

#### CTA → Schedule International Consultation (Calendly, timezone-aware)

---

### 6. HOW IT WORKS / PROCESS PAGE (`process.html`)

#### Animated Vertical Timeline
Each stage has:
- Stage number (large, navy)
- Icon
- Title
- Description (2-3 sentences)
- Typical timeframe badge

**Stage 1 — Free Strategy Session** (Day 1)
"A 30-minute call where we understand your goals, budget, preferred locations, and investment or lifestyle priorities. No pressure, no sales pitch."

**Stage 2 — Property Brief & Search Criteria** (Week 1)
"We document your exact requirements and begin our search — advertised, pre-market, and off-market."

**Stage 3 — Market Research & Suburb Analysis** (Week 1-2)
"We analyse target suburbs for growth potential, rental yields, infrastructure pipeline, and value metrics."

**Stage 4 — Property Shortlisting & Inspections** (Week 2-6)
"We inspect and assess shortlisted properties, prepare due diligence reports, and present only the best options."

**Stage 5 — Due Diligence & Offer Strategy** (Week 5-8)
"Building inspections, strata reports, pest reports, comparable sales analysis — we leave nothing to chance."

**Stage 6 — Negotiation or Auction Bidding** (Week 6-10)
"We negotiate price, terms, and conditions on your behalf — or represent you at auction with confidence."

**Stage 7 — Pre-Settlement & Handover** (Week 10-14)
"We coordinate with solicitors, lenders, and property managers to ensure smooth settlement and post-purchase management."

Animate each stage into view as user scrolls (AOS stagger).

---

### 7. SUBURB INSIGHTS PAGE (`suburb-insights.html`)

This page makes RICO stand out as a data-driven platform.

#### Hero
"We Do The Suburb Research. You Make the Decision."

#### Search Widget (prominent)
Large search bar: "Enter a suburb, postcode or region..."
- Autocomplete using a curated list of Australian suburbs (load from `suburbs.txt`)
- On submit: displays the suburb's data-driven analysis card (generated via the existing prompttemplate.txt format)

#### Featured Suburb Analysis Cards
Display 3-6 pre-generated suburb analysis cards (from `script/evaluation_output/`):
- Geelong VIC
- Girraween NSW
- Add 2-4 more
Each card: suburb name | state | investment score badge | median price | 1 key insight | "View Full Report →"

#### Suburb Comparison Tool
Side-by-side comparison of up to 3 suburbs:
| Metric | Suburb A | Suburb B | Suburb C |
|---|---|---|---|
| Median House Price | | | |
| Gross Rental Yield | | | |
| 5yr Growth | | | |
| Days on Market | | | |
| Distance to CBD | | | |

#### Educational Explainers
Collapsible panels:
- "What makes a suburb a strong investment?"
- "How to read rental yield data"
- "Understanding price-to-rent ratio"
- "Why land-to-asset ratio matters"

#### CTA: "Want a Custom Suburb Report?"
"Book a free consultation and we'll prepare a detailed data brief on your target suburb(s)." → Calendly

---

### 8. CALCULATORS PAGE (`calculators.html`)

#### Hero
"Run the Numbers Before You Buy"

#### Calculator Cards Grid
6 calculator cards with flip animation (front: icon + name + description; back: inline mini-calculator):

1. **Mortgage Repayment Calculator** → `mortgage-calculator.html`
2. **Investment Cash Flow Calculator** → `cashflow-calculator.html`
3. **Stamp Duty Calculator** — State dropdown + property value → stamp duty + any FHOG concessions
4. **Borrowing Power Calculator** — Income, expenses, deposit → max borrow
5. **Property Buying Costs Calculator** — Total cost breakdown (purchase price + stamp duty + legal + inspection + misc)
6. **Rental Yield Calculator** — Purchase price + annual rent → gross yield and price-to-rent ratio

Each calculator:
- Clean card UI with `--color-primary` accents
- Inputs with live validation and formatting (e.g., $ commas)
- Chart.js visualisation where applicable (e.g., mortgage: principal vs interest over time)
- Results highlighted in teal accent box
- "Not sure what to do with these numbers? Book a free strategy session." CTA below result

#### Stamp Duty Calculator — Detailed Spec
State-by-state stamp duty rules embedded as JS data:
- All 8 states/territories (NSW, VIC, QLD, WA, SA, TAS, NT, ACT)
- First home buyer concessions per state
- Foreign buyer surcharge toggle (+8% for foreign buyers)
- Output: duty payable | first home buyer concession applied | net payable

---

### 9. BLOG SYSTEM (`blog/`)

Migrate all 11 existing blog posts to a consistent template with:
- Shared header/footer (HTML include pattern or JS-inserted)
- Author byline
- Reading time estimate
- Social share buttons (Twitter/X, LinkedIn, Facebook, WhatsApp)
- Related articles section (3 cards)
- In-article CTA: "Thinking of buying? Book a free consultation →"
- Schema.org `Article` structured data per post

Blog listing page:
- Filter by category: First Home Buyer | Investor | Market Insights | FHOG | Auction | Due Diligence
- Search bar
- Pagination or "Load More" button
- Featured post hero at top

---

### 10. FIND PROPERTY PAGE (`find-property.html`)

Keep the step-by-step wizard concept, but rebuild with:

**Step 1:** "What type of buyer are you?"
→ Cards: First Home Buyer | Investor | Owner Occupier | International Buyer

**Step 2:** "What is your approximate budget?"
→ Slider with formatted AUD display + manual input

**Step 3:** "Which states or regions interest you?"
→ Checkbox grid of all states + "I'm flexible"

**Step 4:** "What property types interest you?"
→ Checkbox: House | Townhouse | Unit/Apartment | Duplex | Acreage

**Step 5:** "What's most important to you?" (multi-select)
→ Capital growth | Rental yield | Off-market access | School zones | Proximity to CBD | Lifestyle

**Step 6:** "Your details — let's connect"
→ Name, Email, Phone, preferred contact time
→ Submit → Formspree webhook → triggers email to contact@ricobuyersagent.au + auto-reply to client
→ Thank-you screen: "We'll be in touch within 24 hours. In the meantime, book a free call:" + Calendly embed

Progress bar at top showing step X of 6.
Back/Next navigation.
Smooth horizontal slide transitions between steps.

---

### 11. CONTACT PAGE (`contact.html`)

Split-layout:
- **Left:** Contact form (Formspree) — Name, Email, Phone, Message, What service do you need? (dropdown), How did you hear about us? (dropdown)
- **Right:** Contact details + embedded Google Maps (or a static styled map) + WhatsApp quick-link + Calendly embed

---

## ANIMATIONS & INTERACTIONS SPECIFICATION

### Global
- **Scroll reveal:** AOS library — `data-aos="fade-up"` default, `data-aos-delay` staggered for grids
- **Reduced motion:** `@media (prefers-reduced-motion: reduce)` disables all animations
- **Page transitions:** Subtle fade-in on load (300ms CSS opacity transition on `<body>`)

### Hero Section
- GSAP timeline: headline words slide up + fade in (stagger 0.08s per word)
- Background parallax: Jarallax (retain existing library) at 0.4 parallax speed
- Floating CTA button: subtle pulse animation (`box-shadow` keyframe) to draw attention

### Stats Counter (Trust Bar)
- GSAP CountTo: numbers animate from 0 to target value when scrolled into viewport
- Trigger once (no re-trigger on scroll-back)

### Cards (Services, Features)
- Hover: `transform: translateY(-8px)` + `box-shadow` increase (CSS transition, 250ms ease)
- Top border accent in `--color-teal` appears on hover

### Timeline (Process page)
- GSAP ScrollTrigger: horizontal connector line "draws" as user scrolls down
- Each step fades in sequentially

### Calculator Results
- Number values animate from 0 to result with a 600ms ease-out
- Chart.js chart animates in when result is shown

### Navigation
- Hamburger: 3-bars → X morphing animation (CSS transform)
- Mobile menu: full-screen slide-down with staggered nav link fade-in

### Testimonial Carousel
- Swiper.js with `effect: "cards"` or `effect: "fade"`
- Auto-advance every 5s, pause on hover, keyboard accessible

---

## SEO & TECHNICAL SPECIFICATIONS

### On-Page SEO
Every page must include:
```html
<title>[Page-Specific Title] | RICO Buyers Agent</title>
<meta name="description" content="...150 chars max...">
<meta property="og:title" content="...">
<meta property="og:description" content="...">
<meta property="og:image" content="https://ricobuyersagent.au/assets/images/og-image.jpg">
<meta property="og:url" content="https://ricobuyersagent.au/...">
<link rel="canonical" href="https://ricobuyersagent.au/...">
```

### Schema.org Structured Data (JSON-LD)

**Homepage:**
```json
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "RICO Buyers Agent",
  "url": "https://ricobuyersagent.au",
  "telephone": "+61414711771",
  "email": "contact@ricobuyersagent.au",
  "address": {
    "@type": "PostalAddress",
    "addressCountry": "AU"
  },
  "serviceType": "Buyers Agent",
  "areaServed": "Australia",
  "priceRange": "$$"
}
```

**FAQ sections:** `FAQPage` schema with all Q&A pairs
**Blog posts:** `Article` schema with author, datePublished, dateModified
**Calculators:** `WebApplication` schema

### Sitemap
Update `sitemap.xml` to include all new pages, lastmod dates.

### robots.txt
```
User-agent: *
Disallow: /email/
Disallow: /script/
Allow: /
Sitemap: https://ricobuyersagent.au/sitemap.xml
```

---

## ACCESSIBILITY REQUIREMENTS

- WCAG 2.1 AA compliance
- All images: descriptive `alt` text
- Colour contrast ratio: minimum 4.5:1 for body text, 3:1 for large text
- All interactive elements keyboard-navigable with visible `:focus-visible` outline
- ARIA labels on icon-only buttons (WhatsApp, phone, email)
- Form labels associated with inputs
- Skip-to-content link at page top
- `lang="en"` on `<html>`

---

## FORM HANDLING

Replace all Mobirise form handling with **Formspree** (free tier) or **Web3Forms**:

```html
<form action="https://formspree.io/f/[YOUR_ID]" method="POST">
  <input type="hidden" name="_subject" value="New RICO Buyers Agent Enquiry">
  <input type="hidden" name="_next" value="https://ricobuyersagent.au/thank-you.html">
  <!-- fields -->
</form>
```

Auto-reply template: warm, professional, confirms 24-hour response SLA, includes Calendly link.

---

## INTERNATIONAL CLIENT FEATURES (GLOBAL APPEAL)

1. **Currency Converter** — on `for-international-buyers.html` and optionally in the navbar as a dropdown
2. **Time Zone Display** — "Sydney time is currently: [dynamic clock]" — helps international clients know when to call
3. **WhatsApp-first contact** — emphasised for international clients (no Australian phone required)
4. **Multi-language breadcrumb:** Add a language selector (EN | 简体中文 | 日本語 | العربية) — even if it initially links to a "translation coming soon" page, signalling global intent boosts credibility
5. **FIRB info section** — Foreign Investment Review Board requirements explained simply
6. **Timezone-aware Calendly** — Calendly auto-detects visitor timezone; include that message near the CTA
7. **International trust signals:** "We've helped buyers from USA, UK, Singapore, Hong Kong, and UAE purchase Australian property"

---

## CONTENT GUIDELINES

- Tone: Professional, confident, educational — buyer-advocate lens, never sales-driven
- No hype, no "amazing", no emojis in body copy
- Australian English throughout (metre not meter, colour not color, etc.)
- Financial figures in AUD with `$` prefix; include `AUD` label where context is mixed-currency
- Disclaim estimates clearly: "Indicative only. Consult a qualified financial advisor."
- All calculator outputs include: "Results are estimates only. Rates and rules vary by state and change frequently."
- Blog tone: informative, credible, slightly conversational — think The Guardian property section

---

## DEPLOYMENT & CI/CD

Retain the existing GitHub Actions workflow (`.github/workflows/deploy.yml`).
Ensure the deploy workflow:
1. Lints HTML (html-validate or similar)
2. Optimises images (imagemin)
3. Generates updated sitemap
4. Deploys to GitHub Pages on push to `main`

---

## DELIVERABLES CHECKLIST

### Phase 1 — Foundation (Week 1-2)
- [ ] Design system / CSS custom properties file (`assets/css/design-system.css`)
- [ ] Global header component
- [ ] Global footer component
- [ ] Homepage (all 11 sections)
- [ ] Responsive across: 320px, 375px, 768px, 1024px, 1440px, 1920px

### Phase 2 — Core Pages (Week 3-4)
- [ ] About page
- [ ] Services page
- [ ] Process / How It Works page
- [ ] Contact page
- [ ] For International Buyers page (with currency converter)

### Phase 3 — Tools & Content (Week 5-6)
- [ ] All 6 calculators (rebuilt)
- [ ] Find Property wizard (rebuilt)
- [ ] Blog listing page
- [ ] All 11 blog posts migrated to new template
- [ ] Suburb Insights page

### Phase 4 — Polish & Launch (Week 7-8)
- [ ] All animations QA'd (including reduced-motion)
- [ ] Lighthouse audit: Performance ≥ 90, SEO ≥ 95, Accessibility ≥ 90
- [ ] Schema.org validation (Google Rich Results Test)
- [ ] Cross-browser testing: Chrome, Firefox, Safari, Edge
- [ ] Mobile testing: iOS Safari, Android Chrome
- [ ] Form submission testing (all forms)
- [ ] WhatsApp button and Tidio widget confirmed
- [ ] Calendly integration confirmed
- [ ] sitemap.xml and robots.txt updated
- [ ] Deploy pipeline confirmed

---

## REFERENCE SITES FOR INSPIRATION

Study the design quality and UX patterns of these buyer agent and property platform sites:
- **Cohen Handler** (cohendler.com.au) — clean, professional Australian buyers agent
- **Propertyology** (propertyology.com.au) — data-driven investor positioning
- **Hello Haus** (hellohaus.com.au) — modern, conversion-optimised buyers agency
- **The Agency** (theagency.com.au) — premium real estate feel

For international property investment platforms:
- **JLL Residential** — global, professional, data-forward
- **Knight Frank** — ultra-premium, international appeal

For animation/interaction inspiration:
- Use GSAP ShowReel examples for scroll-driven animations
- Swiper.js demos for testimonial carousel

---

## SUMMARY OF KEY IMPROVEMENTS OVER CURRENT SITE

| Area | Current State | Target State |
|---|---|---|
| Builder | Mobirise drag-and-drop (locked) | Hand-coded, fully customisable |
| Animation | Jarallax parallax only | GSAP, AOS, CSS transitions throughout |
| International | No dedicated content | Full landing page + currency converter + FIRB guide |
| Services | No dedicated page | 3 service packages with comparison table |
| About | No page | Full story + values + team |
| Blog | Standalone HTML files | Templated, categorised, filterable |
| Calculators | 3 basic tools | 6 tools with Chart.js visualisation |
| Forms | Mobirise backend | Formspree/Web3Forms, reliable and brandable |
| SEO | Minimal meta | Full schema.org, OG tags, sitemap |
| Accessibility | Untested | WCAG 2.1 AA |
| Mobile | Functional but basic | Best-in-class, sticky CTA, thumb-friendly |
| Trust signals | None visible | Stats bar, star ratings, testimonial carousel |
| Performance | ~65 Lighthouse | Target ≥ 90 |

---

*End of redesign prompt. All brand elements, contact details, and existing tools must be preserved and enhanced. The primary colour `#2c5282` is non-negotiable. Do not introduce any design system that deviates from the navy/teal palette defined in the colour table above.*
