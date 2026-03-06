# Agricultural Expert System

A rule-based expert system for diagnosing crop diseases using React, Node.js, and SWI-Prolog.

## Prerequisites

1. **Node.js**: Install from [nodejs.org](https://nodejs.org/).
2. **SWI-Prolog**: Install from [swi-prolog.org](https://www.swi-prolog.org/).
   - **Important**: Ensure `swipl` is added to your system environment `PATH` during installation.

## Project Structure

- `client/`: React Frontend application.
- `server/`: Node.js Express Backend API.
- `prolog/`: SWI-Prolog Knowledge Base and Logic Engine.

## Setup & Running

### 1. Backend (Server)

1. Open a terminal.
2. Navigate to the server directory:
   ```bash
   cd server
   ```
3. Install dependencies:
   ```bash
   npm install
   ```
4. Start the server:
   ```bash
   node index.js
   ```
   Server runs on `http://localhost:5000`.

### 2. Frontend (Client)

1. Open a new terminal.
2. Navigate to the client directory:
   ```bash
   cd client
   ```
3. Install dependencies:
   ```bash
   npm install
   ```
4. Start the React app:
   ```bash
   npm run dev
   ```
   The application will open in your browser at `http://localhost:3000`.

## Usage

1. Select a Crop from the dropdown (Maize, Rice, Cassava, Tomato).
2. Check the observed symptoms from the list.
3. Click "Diagnose".
4. The system will display the identified disease, treatment, and preventive advice.

## System Architecture

- **User Interface**: React.js sends user input (Crop + Symptoms) to the backend.
- **Backend API**: Node.js receives the request and constructs a Prolog query.
- **Inference Engine**: SWI-Prolog loads the Knowledge Base (`expert_system.pl`) and executes the query to match rules.
- **Response**: The result is formatted as JSON and sent back to the frontend for display.
