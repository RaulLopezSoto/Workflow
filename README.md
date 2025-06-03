🔁 Automated Code Workflow with n8n, Docker, and AI Integration
This project provides a complete setup for running an automated code generation, correction, and analysis workflow using n8n, OpenRouter LLMs, Telegram, SonarQube, and Whisper. It is containerized using Docker for easy deployment.

📦 Files Overview
Dockerfile
Builds the custom n8n image used to run the automation workflow.

docker-compose.yml
Orchestrates the containers: n8n, SonarQube, PostgreSQL, and any needed services like ngrok.

sonar.properties
Configuration file for SonarQube's internal behavior.

n8n-workflow.json
Contains the export of the n8n workflow. You can import this file directly into your n8n instance.

🔐 Required Credentials
1. Telegram Bot Token
You need to create a bot via BotFather on Telegram:

Search for @BotFather in Telegram.
Use /newbot and follow the steps.
Copy the API token and set it as an environment variable or secret inside n8n (TELEGRAM_BOT_TOKEN).
2. SonarQube Token
Start the SonarQube server (included in docker-compose.yml).
Create a user token under My Account > Security.
Use this token in n8n or via environment variables to authenticate API requests.
3. OpenRouter API Key (Optional but recommended)
To interact with LLMs like LLaMA 4 or Mixtral, get your key from OpenRouter.ai and insert it in the appropriate n8n node.

🌐 HTTPS with ngrok (Recommended)
To allow external services (like Telegram) to reach your local instance of n8n, you need an HTTPS-accessible URL:

Download ngrok and sign up for a free account.
Connect your account using: 3.Start ngrok on the port used by n8n (usually 5678): 4.Use the generated HTTPS URL (e.g., https://random-id.ngrok.io) as the webhook endpoint for your Telegram bot.
🚀 Usage Instructions
Clone the repository:git clone https://github.com/RaulLopezSoto/Workflow.git 
Update docker-compose.yml and n8n-workflow.json with your actual credentials.
Start all services: docker-compose up --build
Import the workflow into n8n via the editor UI.
Start ngrok and set the webhook URL in your Telegram bot using the /setwebhook command from BotFather or via Telegram API.
