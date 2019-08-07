### Downloading the MMETSP database from cyverse

There was a recent update to the MMETSP database where the reads were cleaned using the Winston cleaner (insert link). 

#### Requirements
* Access to Cyverse
* Ability to use iCommands


#### Set-up repo & gain access to Cyverse

Clone this repo and ensure access to Cyverse is set up using iCommand.  
[Follow these instructions](https://cyverse-data-store-guide.readthedocs-hosted.com/en/latest/step2.html)

```
git clone https://github.com/shu251/download-mmetsp.git


# If working on an HPC, iCommand may already be set up
module load irods

# Input Cyverse access information for iCommands
# You will only need to do this once

iinit

```

#### Locate MMETSP files within Cyverse & generate list

```
cd download-mmetsp

# The following bash script may take 15-20 minutes, use screen or execute as SLURM
bash base_list.sh
```

The above bash script is using the iCommand command ```ils``` to view the files listed in the MMETSP samples. Since I couldn't find any complete list of MMETSP files with full paths, I am writing these file names to my current directory as separate text files. This is temporary, and these can be removed right after the next step.

#### Run loop in R to generate bash script to execute actual download

```
Rscript /Users/sarahhu/Desktop/Projects/TaraOceans_Euk_metaG_metaT/download-mmetsp/write-mmetsp-bash.R 
```

#### Re-assemble cleaned reads?
