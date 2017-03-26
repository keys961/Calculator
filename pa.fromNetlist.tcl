
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name FinalProject -dir "Z:/FinalProject/planAhead_run_2" -part xc7k160tffg676-2L
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "Z:/FinalProject/Top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {Z:/FinalProject} }
set_property target_constrs_file "Constraint.ucf" [current_fileset -constrset]
add_files [list {Constraint.ucf}] -fileset [get_property constrset [current_run]]
link_design
