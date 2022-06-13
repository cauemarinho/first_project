#!/bin/sh
echo "Terraform Destroy"
terraform -chdir="/Users/cauemarinho/Documents/git_dir/first_project/terraform_caue/" apply -destroy -auto-approve
echo "Terraform Apply"
terraform -chdir="/Users/cauemarinho/Documents/git_dir/first_project/terraform_caue/" apply -auto-approve
echo "Create Table cauemarinho-training.python_generate.raw_data"
cd python_caue/env/
source bin/activate
python3 create_tbl.py
cd ~/Documents/git_dir/first_project/dbt_caue/
echo "dbt run"
dbt deps
dbt debug
dbt seed
#dbt seed --select raw_customers 
dbt run
dbt test
cd ~/Documents/git_dir/first_project/python_caue/env/
echo "Insert Values into cauemarinho-training.python_generate.raw_data to test incremental materialization"
python3 insert_tbl.py
echo "dbt run - increment"
cd ~/Documents/git_dir/first_project/dbt_caue/
dbt run -m increment
echo "dbt run - increment_count this runs merge to keep data updated"
dbt run -m increment_count
echo "dbt run - snapshot to have all historical data about a table"
dbt snapshot
deactivate
dbt docs generate
dbt docs serve