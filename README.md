# Plant Database Application

This application is a web-based tool for exploring and visualizing plant data, including plant families, rotations, and individual plant information. It uses a Neo4j database to store and query plant data, with a Python FastAPI backend and a JavaScript frontend.

## Features

- Interactive graph visualization of plant families and their relationships
- Plant family selection and detailed information display
- Plant rotation recommendations for each family
- List of plants within each family, including scientific names and basic information

## Technologies Used

- Backend: Python 3.7+, FastAPI, Neo4j (via neo4j-driver)
- Frontend: HTML5, CSS3, JavaScript (ES6+)
- Database: Neo4j
- Libraries: D3.js for graph visualization, Bootstrap for styling

## Setup

### Prerequisites

- Python 3.7 or higher
- Neo4j Database (local or cloud instance)
- Node.js and npm (for managing frontend dependencies)

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/plant-database-app.git
   cd plant-database-app
   ```

2. Set up a virtual environment and install Python dependencies:
   ```
   python -m venv venv
   source venv/bin/activate  # On Windows, use `venv\Scripts\activate`
   pip install -r requirements.txt
   ```

3. Set up environment variables:
   Create a `.env` file in the root directory and add the following:
   ```
   NEO4J_URI=bolt://localhost:7687  # Replace with your Neo4j URI
   NEO4J_USER=neo4j
   NEO4J_PASSWORD=your_password
   NEO4J_DATABASE=neo4j  # Replace if you're using a different database name
   ```

4. Initialize the Neo4j database:
   Run the Cypher scripts in the `data` directory to populate your database with plant data.

5. Install frontend dependencies:
   ```
   npm install
   ```

## Running the Application

1. Start the FastAPI server:
   ```
   uvicorn plant:app --reload
   ```

2. Open a web browser and navigate to `http://localhost:8000` to view the application.

## Usage

1. Upon loading, you'll see a graph visualization of plant families and their relationships.
2. Use the dropdown menu to select a specific plant family.
3. View detailed information about the selected family, including rotation recommendations.
4. Explore the list of plants within the selected family.

## API Endpoints

- `/plant_families`: Get a list of all plant families
- `/plant_rotation?family={family_name}`: Get rotation recommendations for a specific family
- `/plants_in_family?family={family_name}`: Get a list of plants in a specific family
- `/plant_graph`: Get data for the plant relationship graph

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
