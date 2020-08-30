#!/bin/bash
#SBATCH --job-name jupyter
#SBATCH --output jupyter_%j.log
#SBATCH --partition medium
#SBATCH -n 10
#SBATCH --mem 50GB
#SBATCH --time 100:00:00
date;hostname;pwd

unset XDG_RUNTIME_DIR

port=$(shuf -i 20000-30000 -n 1)

echo -e "\nStarting Jupyter Notebook on port ${port} on the $(hostname) server."
echo -e "\nSSH tunnel command: ssh -NL ${port}:localhost:${port} ${USER}@$(hostname)"
echo -e "\nLocal URI: http://localhost:${port}"

echo -e "Activating MoSeq2 virtual environment..."
cd ~/opt/anaconda3/envs/
source activate moseq2
cd ${HOME}
jupyter notebook --no-browser --port=${port} --ip='*'

date