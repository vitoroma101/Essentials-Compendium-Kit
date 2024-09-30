# Load the necessary libraries
library(dplyr)
library(ggplot2)
library(DiagrammeRsvg)
library(rsvg)
library(DiagrammeR)

# Create a detailed flowchart using DiagrammeR with zoom adjustments and left-to-right orientation
p <- grViz("
digraph detailed_sustainability_pillars {

  # Define graph attributes with increased size for zoom and left-to-right orientation
  graph [rankdir=LR, fontsize=12, nodesep=0.3, ranksep=1.0, width=10, height=10] # rankdir=LR sets the orientation from left to right
  
  # Define node attributes
  node [shape=box, fontname=Helvetica, fontsize=12, style=filled, fillcolor=lightgrey]
  
  # Root node
  Root [label='Pillars of Sustainability', fillcolor='#76C7C0']
  
  # Main nodes with descriptions
  Environmental [label='Environmental Protection', fillcolor='#ADD8E6']
  Economic [label='Economic Development', fillcolor='#ADD8E6']
  Social [label='Social Equity', fillcolor='#FFD700']
  Cultural [label='Cultural Sustainability', fillcolor='#98FB98']

  # Second-level nodes with details
  Conservation [label='Conservation Efforts\\n- Biodiversity\\n- Natural Resources', fillcolor='#E6E6FA']
  PollutionControl [label='Pollution Control\\n- Emission Reductions\\n- Waste Management', fillcolor='#E6E6FA']

  SustainableBusiness [label='Sustainable Business Practices\\n- Green Technologies\\n- Ethical Supply Chains', fillcolor='#E6E6FA']
  JobCreation [label='Job Creation\\n- Green Jobs\\n- Fair Wages', fillcolor='#E6E6FA']

  HumanRights [label='Human Rights\\n- Fair Treatment\\n- Safe Working Conditions', fillcolor='#E6E6FA']
  CommunityDevelopment [label='Community Development\\n- Local Empowerment\\n- Education Access', fillcolor='#E6E6FA']

  CulturalPreservation [label='Cultural Preservation\\n- Heritage Sites\\n- Traditional Practices', fillcolor='#E6E6FA']
  EducationInitiatives [label='Education Initiatives\\n- Cultural Awareness\\n- Language Programs', fillcolor='#E6E6FA']

  # Third-level nodes with more details
  Biodiversity [label='Biodiversity\\n- Habitat Protection\\n- Species Conservation', fillcolor='#FFF8DC']
  NaturalResources [label='Natural Resources\\n- Sustainable Use\\n- Reforestation', fillcolor='#FFF8DC']

  EmissionReductions [label='Emission Reductions\\n- Renewable Energy\\n- Energy Efficiency', fillcolor='#FFF8DC']
  WasteManagement [label='Waste Management\\n- Recycling Programs\\n- Hazardous Waste Control', fillcolor='#FFF8DC']

  GreenTechnologies [label='Green Technologies\\n- Renewable Energy Tech\\n- Sustainable Materials', fillcolor='#FFF8DC']
  EthicalSupplyChains [label='Ethical Supply Chains\\n- Fair Trade\\n- Responsible Sourcing', fillcolor='#FFF8DC']

  GreenJobs [label='Green Jobs\\n- Clean Energy Jobs\\n- Environmental Services', fillcolor='#FFF8DC']
  FairWages [label='Fair Wages\\n- Living Wage\\n- Wage Equity', fillcolor='#FFF8DC']

  FairTreatment [label='Fair Treatment\\n- Non-Discrimination\\n- Equal Opportunity', fillcolor='#FFF8DC']
  SafeWorkingConditions [label='Safe Working Conditions\\n- Workplace Safety\\n- Health Protections', fillcolor='#FFF8DC']

  LocalEmpowerment [label='Local Empowerment\\n- Community Leadership\\n- Participatory Governance', fillcolor='#FFF8DC']
  EducationAccess [label='Education Access\\n- Inclusive Education\\n- Lifelong Learning', fillcolor='#FFF8DC']

  HeritageSites [label='Heritage Sites\\n- Protection\\n- Restoration', fillcolor='#FFF8DC']
  TraditionalPractices [label='Traditional Practices\\n- Cultural Festivals\\n- Handicrafts', fillcolor='#FFF8DC']

  CulturalAwareness [label='Cultural Awareness\\n- Intercultural Dialogues\\n- Diversity Training', fillcolor='#FFF8DC']
  LanguagePrograms [label='Language Programs\\n- Language Preservation\\n- Bilingual Education', fillcolor='#FFF8DC']

  # Define the connections between nodes
  Root -> {Environmental Economic Social Cultural}

  Environmental -> {Conservation PollutionControl}
  Conservation -> {Biodiversity NaturalResources}
  PollutionControl -> {EmissionReductions WasteManagement}

  Economic -> {SustainableBusiness JobCreation}
  SustainableBusiness -> {GreenTechnologies EthicalSupplyChains}
  JobCreation -> {GreenJobs FairWages}

  Social -> {HumanRights CommunityDevelopment}
  HumanRights -> {FairTreatment SafeWorkingConditions}
  CommunityDevelopment -> {LocalEmpowerment EducationAccess}

  Cultural -> {CulturalPreservation EducationInitiatives}
  CulturalPreservation -> {HeritageSites TraditionalPractices}
  EducationInitiatives -> {CulturalAwareness LanguagePrograms}
}
")

# Display the created diagram
p

# Save the diagram as an SVG file
svg_code <- export_svg(p)  # Export the diagram as SVG code

# Render the SVG to a high-resolution PNG file
rsvg_png(charToRaw(svg_code), file = "sustainability_pillars_high_res.png", width = 3000, height = 3000)
