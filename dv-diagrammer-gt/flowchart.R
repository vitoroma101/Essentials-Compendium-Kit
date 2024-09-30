# Load the necessary libraries
library(DiagrammeR)
library(gt)
library(DiagrammeRsvg)
library(rsvg)

# Create a detailed flowchart using DiagrammeR with zoom adjustments and left-to-right orientation
p <- grViz("
digraph ProcessMapIES {
  rankdir=LR;  # Set the orientation from left to right
  node [shape=box, style=filled, fontname=Helvetica];  # Define node attributes

  // Inputs
  Input [label='Inputs', shape=plaintext, fontsize=12, color=white];

  // Strategic Processes
  Strategic [label='Strategic', shape=plaintext, fontsize=12, color=red, fontcolor=white];
  StrategicPlanning [label='Strategic Planning', fillcolor=lightblue];
  ObjectiveStrategicPlanning [label='Objective: Define long-term goals and strategies to achieve them.', fillcolor=lightblue];
  ActivitiesStrategicPlanning [label='Activities: Development of vision and mission, setting strategic objectives.', fillcolor=lightblue];
  OutputStrategicPlanning [label='Output: Strategic plan.', fillcolor=lightblue];
  
  QualityManagement [label='Quality Management', fillcolor=lightblue];
  ObjectiveQualityManagement [label='Objective: Ensure continuous improvement of educational quality.', fillcolor=lightblue];
  ActivitiesQualityManagement [label='Activities: Implementation of ISO standards, periodic evaluations.', fillcolor=lightblue];
  OutputQualityManagement [label='Output: Quality reports, accreditations.', fillcolor=lightblue];

  // Core Processes
  Core [label='Core', shape=plaintext, fontsize=12, color=green, fontcolor=white];
  TeachingLearning [label='Teaching and Learning', fillcolor=lightgray];
  ObjectiveTeachingLearning [label='Objective: Provide quality education and promote effective learning.', fillcolor=lightgray];
  ActivitiesTeachingLearning [label='Activities: Classes, workshops, evaluations.', fillcolor=lightgray];
  OutputTeachingLearning [label='Output: Graduated students.', fillcolor=lightgray];

  Research [label='Research', fillcolor=lightgray];
  ObjectiveResearch [label='Objective: Generate new knowledge and promote innovation.', fillcolor=lightgray];
  ActivitiesResearch [label='Activities: Research, publications, conferences.', fillcolor=lightgray];
  OutputResearch [label='Output: Publications, patents.', fillcolor=lightgray];

  // Support Processes
  Support [label='Support', shape=plaintext, fontsize=12, color=purple, fontcolor=white];
  ResourceManagement [label='Resource Management', fillcolor=lightpink];
  ObjectiveResourceManagement [label=\"Objective: Efficiently manage institutional resources.\", fillcolor=lightpink];
  ActivitiesResourceManagement [label='Activities: Hiring, purchasing, maintenance.', fillcolor=lightpink];
  OutputResourceManagement [label='Output: Properly allocated and utilized resources.', fillcolor=lightpink];

  StudentServices [label='Student Services', fillcolor=lightpink];
  ObjectiveStudentServices [label='Objective: Support the integral development and well-being of students.', fillcolor=lightpink];
  ActivitiesStudentServices [label='Activities: Health services, counseling, extracurricular activities.', fillcolor=lightpink];
  OutputStudentServices [label='Output: Satisfied and well-integrated students.', fillcolor=lightpink];

  // Outputs
  Output [label='Outputs', shape=plaintext, fontsize=12, color=yellow, fontcolor=black];
  
  # Define connections between nodes
  Input -> Strategic;
  Input -> Core;
  Input -> Support;
  
  Strategic -> StrategicPlanning -> ObjectiveStrategicPlanning -> ActivitiesStrategicPlanning -> OutputStrategicPlanning -> Output;
  Strategic -> QualityManagement -> ObjectiveQualityManagement -> ActivitiesQualityManagement -> OutputQualityManagement -> Output;

  Core -> TeachingLearning -> ObjectiveTeachingLearning -> ActivitiesTeachingLearning -> OutputTeachingLearning -> Output;
  Core -> Research -> ObjectiveResearch -> ActivitiesResearch -> OutputResearch -> Output;
  
  Support -> ResourceManagement -> ObjectiveResourceManagement -> ActivitiesResourceManagement -> OutputResourceManagement -> Output;
  Support -> StudentServices -> ObjectiveStudentServices -> ActivitiesStudentServices -> OutputStudentServices -> Output;

  // Define colors for the labels
  Strategic [fillcolor=red];
  Core [fillcolor=green];
  Support [fillcolor=purple];
  Output [fillcolor=yellow];
}
")

# Display the created diagram
p

# Save the diagram as an SVG file
svg_code <- export_svg(p)  # Export the diagram as SVG code

# Render the SVG to a high-resolution PNG file
rsvg_png(charToRaw(svg_code), file = "higher_education_process_flowchart.png", width = 3000, height = 3000)

# Create a data frame with the provided data
processes_ies <- data.frame(
  Process = c("Strategic Planning", "Quality Management", "Teaching and Learning", 
              "Research", "Resource Management", "Student Services"),
  Objective = c("Define long-term goals and strategies to achieve them.",
                "Ensure continuous improvement of educational quality.",
                "Provide quality education and promote effective learning.",
                "Generate new knowledge and promote innovation.",
                "Efficiently manage institutional resources.",
                "Support the integral development and well-being of students."),
  Input = c("Environmental analysis, available resources.",
            "Internal and external evaluations, feedback from students and employers.",
            "Curriculum, teaching resources.",
            "Research projects, funding.",
            "Financial, human, and material resources.",
            "Student needs and requests."),
  Activities = c("Development of vision and mission, setting strategic objectives.",
                 "Implementation of ISO standards, periodic evaluations.",
                 "Classes, workshops, evaluations.",
                 "Research, publications, conferences.",
                 "Hiring, purchasing, maintenance.",
                 "Health services, counseling, extracurricular activities."),
  Output = c("Strategic plan.",
             "Quality reports, accreditations.",
             "Graduated students.",
             "Publications, patents.",
             "Properly allocated and utilized resources.",
             "Satisfied and well-integrated students.")
)

# Create the table using gt
ies_processes_table <- gt(processes_ies)

# Display the table
print(ies_processes_table)

# Save the table as an image
gtsave(ies_processes_table, "higher_education_process_tab.png")
