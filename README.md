# DCIT313-GROUP-AI-MECHANICS-AGRICULTURAL-EXPERT-SYSTEM
Our team members are:            
1. Revic Osei Owusu [r-owusu] -                                        22161849          
2. Ilyas Osman [SamuncleML] -                                            22099559           
3. ⁠Nana Boateng Yeboah [Beee45] -                                     22142270
4. ⁠Dennis Kwaku Dapaah Adomako [DennisAdomako-blip] -                              22238484
5. Yusif Ibrahim [Yusif-adventure] -                                           22035728

Project manager
1. Revic Osei Owusu -                                        

Knowledge Engineers

1. Osman Ilyas

2. Nana Boateng Yeboah
   
Programmers

1. Yusif Ibrahim
2.  ⁠Dennis Kwaku Dapaah Adomako-Bansah Zuel

Our Project Aim
We designed and developed a rule-based agricultural expert system that assists farmers in diagnosing crop diseases and provides appropriate treatment and farming recommendations.

Our Objectives
We aim to:
- Identify crop diseases based on observable symptoms
- Diagnose soil and nutrient deficiencies
- Recommend appropriate treatments and fertilizers
- Provide preventive farming advice
- Support decision-making for farmers
- Reduce dependence on physical access to agricultural experts.
  
Our System Scope

We focused on selected crops (e.g. maize, rice, cassava, tomatoes), common diseases and pests, soil nutrient problems, and basic treatment and prevention methods. We used a rule-based knowledge base and inference engine to simulate human expert reasoning.

## Common Crop Diseases and Symptoms

We diagnose common diseases that affect the supported crops (maize, rice, cassava, and tomato). Our knowledge engineers, Osman Ilyas and Nana Boateng Yeboah, researched and compiled the following detailed list of diseases grouped by crop, including their key symptoms:

### Maize Diseases
- **Nitrogen Deficiency**: Yellowing of leaves, stunted growth.
- **Maize Streak Virus**: Streak patterns on leaves, chlorosis (yellowing).
- **Fall Armyworm**: Ragged leaves, sawdust-like frass.
- **Gray Leaf Spot**: Gray rectangular lesions on leaves, blight.
- **Northern Corn Leaf Blight**: Cigar-shaped lesions, gray-green lesions.
- **Stalk Rot**: Rotting stalk, premature plant death.

### Rice Diseases
- **Rice Blast**: Diamond-shaped lesions, white center spots.
- **Bacterial Leaf Blight**: Water-soaked streaks, yellow or orange leaves.
- **Sheath Blight**: Oval spots on sheath, irregular borders.
- **Brown Spot**: Brown circular spots, yellow halo spots.
- **Tungro Virus**: Stunted plants, yellow or orange discoloration.
- **Stem Borer**: Deadheart (dead central shoot), whitehead (white panicle).

### Cassava Diseases
- **Cassava Mosaic Disease**: Mosaic pattern on leaves, distorted leaves.
- **Cassava Brown Streak Disease**: Yellow chlorosis on veins, brown streaks on stem.
- **Bacterial Blight**: Water-soaked spots, leaf blight and wilting.
- **Root Rot**: Soft rotting roots, foul smell.
- **Green Mite**: Yellow speckles, reduced leaf size.
- **Mealybug**: Curled and distorted leaves, white waxy substance.

### Tomato Diseases
- **Early Blight**: Concentric rings on leaves, yellowing of lower leaves.
- **Late Blight**: Water-soaked lesions, white fungal growth.
- **Bacterial Wilt**: Sudden wilting, no yellowing.
- **Tomato Yellow Leaf Curl Virus**: Upward curling leaves, yellow leaf margins.
- **Blossom End Rot**: Black leather-like spot on fruit bottom, calcium deficiency signs.
- **Septoria Leaf Spot**: Small circular spots, gray-white centers.

These diseases represent prevalent issues in agricultural settings for the respective crops, allowing farmers to identify problems early based on visible symptoms.

# Our Agricultural Expert System

We built a rule-based expert system for diagnosing crop diseases using React, Node.js, and SWI-Prolog.

## Prerequisites

We require the following software to run our system:

1. **Node.js**: We recommend installing from [nodejs.org](https://nodejs.org/).
2. **SWI-Prolog**: We recommend installing from [swi-prolog.org](https://www.swi-prolog.org/).
   - **Important**: We ensure `swipl` is added to your system environment `PATH` during installation.

## Our Project Structure

We organized our project with the following structure:
- `client/`: React Frontend application developed by our programmers Yusif Ibrahim and Dennis Kwaku Dapaah Adomako-Bansah Zuel.
- `server/`: Node.js Express Backend API developed by our programmers.
- `prolog/`: Original SWI-Prolog Knowledge Base and Logic Engine.
- `plant_expert/`: Restructured Prolog expert system with modular knowledge base and inference engine (current runtime entry point: `plant_expert/main.pl`).

## Our Setup & Running Instructions

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
   Our server runs on `http://localhost:5000`.

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
   Our application will open in your browser at `http://localhost:3000`.

## Our Usage Instructions

1. Select a Crop from the dropdown (Maize, Rice, Cassava, Tomato).
2. Check the observed symptoms from the list.
3. Click "Diagnose".
4. Our system will display the identified disease, treatment, and preventive advice.

## API Endpoints

- `GET /api/health`: Returns backend health status and active Prolog entrypoint.
- `POST /api/diagnose`: Accepts crop and symptom list, validates inputs, runs Prolog diagnosis, and returns ranked results (top matches + confidence).

Example request body:

```json
{
   "crop": "maize",
   "symptoms": ["yellow_leaves", "stunted_growth"]
}
```

Example response body:

```json
{
   "disease": "Nitrogen Deficiency",
   "treatment": "Apply nitrogen-rich fertilizer like urea or ammonium nitrate.",
   "prevention": "Regularly test soil nutrient levels.",
   "confidence": 100,
   "topMatches": [
      {
         "disease": "Nitrogen Deficiency",
         "confidence": 100,
         "matchedSymptoms": 2,
         "totalSymptoms": 2,
         "treatment": "Apply nitrogen-rich fertilizer like urea or ammonium nitrate.",
         "prevention": "Regularly test soil nutrient levels."
      }
   ]
}
```

## Our System Architecture

We designed our system with the following components:
- **User Interface**: Our programmers developed a React.js frontend that sends user input (Crop + Symptoms) to the backend.
- **Backend API**: Our programmers built a Node.js Express backend that receives the request and constructs a Prolog query.
- **Inference Engine**: We used SWI-Prolog to load the Knowledge Base and execute queries to match rules.
- **Response**: We format the result as JSON and send it back to the frontend for display.
