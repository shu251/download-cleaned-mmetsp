### Downloading the MMETSP database from cyverse

There was a recent update to the MMETSP database where the reads were cleaned of potential contamination with [Winston cleaner](https://github.com/kolecko007/WinstonCleaner). Below are the steps I took to download the cleaned version of the fasta and pep reads from Cyverse. 

#### Requirements
* Access to [Cyverse](http://datacommons.cyverse.org)
* Ability to use [iCommands](https://cyverse-data-store-guide.readthedocs-hosted.com/en/latest/step2.html)


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
# Follow instructions on above website to fill in output from `iinit`
# https://cyverse-data-store-guide.readthedocs-hosted.com/en/latest/step2.html
```

#### Locate MMETSP files within Cyverse & generate list

```
# Move to repo
cd download-mmetsp

# The following bash script may take 15-20 minutes, use screen or execute as SLURM script as needed
bash base_list.sh
```

The above bash script is using the iCommand command ```ils``` to view the files listed in the MMETSP samples. Since I couldn't find any complete list of MMETSP files with full paths, I am writing these file names to my current directory as separate text files. This is temporary, and these can be removed right after the next step.

#### Run loop in R to generate bash script to execute actual download

You may need to enable R ahead of time. For example, on an HPC, ```module load R```. Alternatively, you can run by entering an R-enabled conda environment.  
If you need to download the MMETSP files to a specific directory change line 21 in the Rscript, from ```mmetsp_clean/``` to the full path of where you want the files to be written to.

```
Rscript write-mmetsp-bash.R

# as long as the above writes the download-mmetsp.sh output correctly, remove all the excess *_list.txt files
rm *_list.txt
```

Output from this R script will write ```download-mmetsp.sh``` which is a list of commands that will download the cleaned fasta and pep files from each MMETSP entry. *This is 1350 total files and 675 total MMETSP entries*. An example download is included in this repo ```example-download-mmetsp.sh``` with only 4 entries. Try this first to ensure download pipeline is functional before downloading all 1350 files.  

 
This should be run as a SLURM script or equivalent:
```
module load irods
bash download-mmetsp.sh
```

### Link to EUKulele
