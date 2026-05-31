document.addEventListener('DOMContentLoaded', function () {
    const calculateBtn = document.getElementById('calculate-btn');

    calculateBtn.addEventListener('click', function () {
        // --- Read Inputs ---
        const purchasePrice = parseFloat(document.getElementById('purchasePrice').value) || 0;
        const weeklyRent = parseFloat(document.getElementById('weeklyRent').value) || 0;
        const interestRate = parseFloat(document.getElementById('interestRate').value) / 100 || 0;
        const lvr = parseFloat(document.getElementById('loanToValue').value) / 100 || 0;
        const loanTerm = parseFloat(document.getElementById('loanTerm').value) || 0;
        const stampDuty = parseFloat(document.getElementById('stampDuty').value) || 0;
        const conveyancingFees = parseFloat(document.getElementById('conveyancingFees').value) || 0;
        const establishmentFees = parseFloat(document.getElementById('establishmentFees').value) || 0;
        const buyersAgentFees = parseFloat(document.getElementById('buyersAgentFees').value) || 0;
        const vacancyRate = parseFloat(document.getElementById('vacancyRate').value) / 100 || 0;
        const propertyManagement = parseFloat(document.getElementById('propertyManagement').value) / 100 || 0;
        const councilRates = parseFloat(document.getElementById('councilRates').value) || 0;
        const corporationFees = parseFloat(document.getElementById('corporationFees').value) || 0;
        const insurance = parseFloat(document.getElementById('insurance').value) || 0;
        const repairsMaintenance = parseFloat(document.getElementById('repairsMaintenance').value) || 0;

        // --- Calculations ---

        // Income
        const annualRent = weeklyRent * 52;
        const totalAnnualIncome = annualRent;

        // Expenses
        const loanAmount = purchasePrice * lvr;
        const monthlyInterestRate = interestRate / 12;
        const numberOfPayments = loanTerm * 12;
        const monthlyRepayment = loanAmount * (monthlyInterestRate * Math.pow(1 + monthlyInterestRate, numberOfPayments)) / (Math.pow(1 + monthlyInterestRate, numberOfPayments) - 1);
        const annualRepayments = monthlyRepayment * 12;

        const vacancyCost = totalAnnualIncome * vacancyRate;
        const managementCost = totalAnnualIncome * propertyManagement;
        const totalHoldingCosts = councilRates + corporationFees + insurance + repairsMaintenance;
        const totalAnnualExpenses = annualRepayments + vacancyCost + managementCost + totalHoldingCosts;

        // Cash Flow
        const annualCashflow = totalAnnualIncome - totalAnnualExpenses;
        const weeklyCashflow = annualCashflow / 52;

        // Yields & ROI
        const grossYield = (totalAnnualIncome / purchasePrice) * 100;
        const netYield = ((totalAnnualIncome - totalHoldingCosts) / purchasePrice) * 100;
        const totalUpfrontCosts = (purchasePrice - loanAmount) + stampDuty + conveyancingFees + establishmentFees + buyersAgentFees;
        const roi = (annualCashflow / totalUpfrontCosts) * 100;

        // --- Display Results ---
        const resultsSection = document.getElementById('results');
        resultsSection.style.display = 'block';

        // Summary
        const cashflowStatus = document.getElementById('cashflow-status');
        const cashflowAmount = document.getElementById('cashflow-amount');
        if (weeklyCashflow >= 0) {
            cashflowStatus.textContent = 'positively geared';
            cashflowAmount.textContent = `+${formatCurrency(weeklyCashflow, 2)} per week`;
            cashflowAmount.className = 'positive';
        } else {
            cashflowStatus.textContent = 'negatively geared';
            cashflowAmount.textContent = `${formatCurrency(weeklyCashflow, 2)} per week`;
            cashflowAmount.className = 'negative';
        }

        // Yields
        document.getElementById('gross-yield').textContent = `${grossYield.toFixed(2)}%`;
        document.getElementById('net-yield').textContent = `${netYield.toFixed(2)}%`;
        document.getElementById('roi').textContent = `${roi.toFixed(2)}%`;

        // Breakdowns
        const incomeBreakdown = document.getElementById('income-breakdown');
        incomeBreakdown.innerHTML = `
            <li class="list-group-item"><span>Annual Rent:</span> <span>${formatCurrency(annualRent)}</span></li>
            <li class="list-group-item"><strong>Total Annual Income:</strong> <strong>${formatCurrency(totalAnnualIncome)}</strong></li>
        `;

        const expensesBreakdown = document.getElementById('expenses-breakdown');
        expensesBreakdown.innerHTML = `
            <li class="list-group-item"><span>Loan Repayments (p.a.):</span> <span>${formatCurrency(annualRepayments)}</span></li>
            <li class="list-group-item"><span>Vacancy Costs (p.a.):</span> <span>${formatCurrency(vacancyCost)}</span></li>
            <li class="list-group-item"><span>Property Management (p.a.):</span> <span>${formatCurrency(managementCost)}</span></li>
            <li class="list-group-item"><span>Council Rates (p.a.):</span> <span>${formatCurrency(councilRates)}</span></li>
            <li class="list-group-item"><span>Corporation Fees (p.a.):</span> <span>${formatCurrency(corporationFees)}</span></li>
            <li class="list-group-item"><span>Insurance (p.a.):</span> <span>${formatCurrency(insurance)}</span></li>
            <li class="list-group-item"><span>Repairs & Maintenance (p.a.):</span> <span>${formatCurrency(repairsMaintenance)}</span></li>
            <li class="list-group-item"><strong>Total Annual Expenses:</strong> <strong>${formatCurrency(totalAnnualExpenses)}</strong></li>
        `;
    });

    // Helper function for currency formatting
    function formatCurrency(amount, decimalPlaces = 0) {
        const options = {
            style: 'currency',
            currency: 'AUD',
            minimumFractionDigits: decimalPlaces,
            maximumFractionDigits: decimalPlaces,
        };
        return amount.toLocaleString('en-AU', options);
    }
});
