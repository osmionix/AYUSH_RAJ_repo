let activePlayer = 1;
let playerScores = { 1: { saved: 0, current: 0 }, 2: { saved: 0, current: 0 } };
let dicePic = document.getElementById("dicePic");

document.getElementById("rollBtn").addEventListener("click", rollDice);
document.getElementById("saveBtn").addEventListener("click", saveScore);
document.getElementById("resetBtn").addEventListener("click", resetGame);

function rollDice() {
    let diceRoll = Math.floor(Math.random() * 6) + 1;
    let diceImages = [
        "https://cdn-icons-png.flaticon.com/128/10990/10990645.png",
        "https://cdn-icons-png.flaticon.com/128/10990/10990646.png",
        "https://cdn-icons-png.flaticon.com/128/10990/10990647.png",
        "https://cdn-icons-png.flaticon.com/128/10990/10990648.png",
        "https://cdn-icons-png.flaticon.com/128/10990/10990649.png",
        "https://cdn-icons-png.flaticon.com/128/10990/10990650.png"
    ];
    
    dicePic.src = diceImages[diceRoll - 1];

    if (diceRoll === 1) {
        playerScores[activePlayer].current = 0;
        switchPlayer();
    } else {
        playerScores[activePlayer].current += diceRoll;
    }

    updateDisplay();
}

function saveScore() {
    playerScores[activePlayer].saved += playerScores[activePlayer].current;
    playerScores[activePlayer].current = 0;

    if (playerScores[activePlayer].saved >= 100) {
        document.getElementById("gameResult").innerText = 
            `${document.getElementById(`player${activePlayer === 1 ? 'A' : 'B'}Name`).value} Wins!`;
        disableButtons();
    } else {
        switchPlayer();
    }

    updateDisplay();
}

function switchPlayer() {
    activePlayer = activePlayer === 1 ? 2 : 1;
}

function resetGame() {
    playerScores = { 1: { saved: 0, current: 0 }, 2: { saved: 0, current: 0 } };
    activePlayer = 1;
    document.getElementById("gameResult").innerText = "";
    enableButtons();
    updateDisplay();
}

function updateDisplay() {
    document.getElementById("playerASaved").innerText = playerScores[1].saved;
    document.getElementById("playerACurrent").innerText = playerScores[1].current;
    document.getElementById("playerBSaved").innerText = playerScores[2].saved;
    document.getElementById("playerBCurrent").innerText = playerScores[2].current;
}

function disableButtons() {
    document.getElementById("rollBtn").disabled = true;
    document.getElementById("saveBtn").disabled = true;
}

function enableButtons() {
    document.getElementById("rollBtn").disabled = false;
    document.getElementById("saveBtn").disabled = false;
}
