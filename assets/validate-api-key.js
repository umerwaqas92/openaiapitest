const openaiForm = document.getElementById("openai-form");
const resultDiv = document.getElementById("result");

openaiForm.addEventListener("submit", (event) => {
  event.preventDefault();
  const apiKey = event.target.elements["api-key-input"].value;
  validateApiKey(apiKey);
});

function validateApiKey(apiKey) {
  const apiUrl = "https://api.openai.com/v1/chat/completions";
  const requestOptions = {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Authorization": `Bearer ${apiKey}`
    },
    body: JSON.stringify({
      "model": "gpt-3.5-turbo",
      "messages": [{"role": "user", "content": "Hello!"}]
    })
  };
  resultDiv.innerText = "Checking API...";
  fetch(apiUrl, requestOptions)
    .then(response => {
      if (response.ok) {
        resultDiv.innerText = "API key is valid.";
      } else {
        resultDiv.innerText = "API key is not valid.";
      }
    })
    .catch(error => {
      resultDiv.innerText = `Error validating API key: ${error.message}`;
    });
}
