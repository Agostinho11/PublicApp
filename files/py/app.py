import streamlit as st
import importlib.util
import os

# Build the full path to the .pyc file from app/
base_dir = os.path.dirname(__file__)  # This will be "app/"

# Correct paths to the .pyc files
pyc_path_converters = os.path.join(base_dir, 'libs', '__pycache__', 'converters.cpython-313.pyc')
pyc_path_generators = os.path.join(base_dir, 'libs', '__pycache__', 'generators.cpython-313.pyc')
pyc_path_pdf_tools = os.path.join(base_dir, 'libs', '__pycache__', 'pdf_tools.cpython-313.pyc')

# Load the .pyc modules with correct spec names
spec_converts = importlib.util.spec_from_file_location("converters", pyc_path_converters)
spec_generators = importlib.util.spec_from_file_location("generators", pyc_path_generators)
spec_pdf_tools = importlib.util.spec_from_file_location("pdf_tools", pyc_path_pdf_tools)

# Create module objects
converts = importlib.util.module_from_spec(spec_converts)
generators = importlib.util.module_from_spec(spec_generators)
pdf_tools = importlib.util.module_from_spec(spec_pdf_tools)

# Execute the modules
spec_converts.loader.exec_module(converts)
spec_generators.loader.exec_module(generators)
spec_pdf_tools.loader.exec_module(pdf_tools)

st.set_page_config(page_title="Utility App", layout="centered")

category = st.sidebar.selectbox(
    "🔧 Choose a Category",
    ["", "Converters", "Merge & Split", "Generators"],
    format_func=lambda x: "Select a category" if x == "" else x
)

st.title("🛠️ Utility Tool Suite")
menu = None
if category == "Converters":
    menu = st.sidebar.radio(
        "🧰 Converter Tools", 
        ["Images to PDF", "PDF to Image", "Change Images Format"])
    converts.converts(menu)

elif category == "Merge & Split":
    menu = st.sidebar.radio(
        "🧩 Merge & Split Tools", 
        ["Merge PDFs", "Split PDF", "Reorder PDF Pages", "Remove PDF Page"])
    pdf_tools.pdf_tools(menu)

elif category == "Generators":
    menu = st.sidebar.radio(
        "⚙️ Generator Tools", 
        ["QR Code", "Add Password", "Remove Password", "Create Water Mark", "Add Water Mark"])
    generators.generator(menu)
