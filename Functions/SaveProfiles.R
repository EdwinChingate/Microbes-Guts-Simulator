source('Functions/RetrieveBiomass.R')
source('Functions/RetrieveComposition.R')
SaveProfiles <- function(eval,SpaceLocationInf,CellVolume,GridSize,MicrobeMass){
  time0 <- Sys.time()
  CurrentTime <- gsub(' ','_',toString(time0))
  ResultsFolder <- paste(home,'/Results',sep='')
  dir.create(ResultsFolder)
  CurrentResult <- paste(ResultsFolder,'/',CurrentTime,sep='')
  dir.create(CurrentResult)
  Biomass_DF <- RetrieveBiomass(eval,CellVolume,GridSize,MicrobeMass)
  Biomass_DF <- merge(SpaceLocationInf,Biomass_DF, by = 'TimeSteps')
  BiomassProfileLocation <- paste(CurrentResult,'/Biomass(cells_uL).xlsx',sep='')
  write_xlsx(Biomass_DF,BiomassProfileLocation)
  Concentrations_DF <- RetrieveComposition(eval,CellVolume)
  Concentrations_DF <- merge(SpaceLocationInf,Concentrations_DF, by = 'TimeSteps')
  ConcentrationProfileLocation <- paste(CurrentResult,'/Metabolites(mM).xlsx',sep='')
  write_xlsx(Concentrations_DF,ConcentrationProfileLocation)  
}