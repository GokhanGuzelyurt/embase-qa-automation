@regression @api @PublicApiInternal @skip @BE
Feature: Public API - Internal

  Background:
    Given I set the endpoint for the http request to /mock/login
    And I set the request header Content-Type with value application/json
    And I concatenate the request body with content from file mock-sguserdetails.json
    And I execute the http request with method POST
    And I capture cookies from the authentication method

  @EmtreeWipAdded
  Scenario Outline: Verify that added Emtree terms from 2021.03 are present BE
    Given I set the endpoint for the http request to /rest/searchquery/term/autocomplete
    And I set the queryParam term with value <term>
    And I set the queryParam limit with value 10
    And I set a valid SESSION cookie
    When I execute the http request with method GET
    And the status code of the response is 200
    And the first suggested term is <term>
    Examples:
      | term                                                                                     |
      | aav rdh12                                                                                |
      | acetylsalicylic acid plus ethoheptazine plus meprobamate                                 |
      | agle 117                                                                                 |
      | alexa fluor                                                                              |
      | alexa fluor 488                                                                          |
      | alexa fluor 546                                                                          |
      | alexa fluor 555                                                                          |
      | alexa fluor 568                                                                          |
      | alexa fluor 594                                                                          |
      | alexa fluor 647                                                                          |
      | alexa fluor 750                                                                          |
      | alginic acid plus potassium bicarbonate                                                  |
      | alisitol plus retinol palmitate plus gluconate zinc                                      |
      | ap103                                                                                    |
      | aru 1801                                                                                 |
      | asn90                                                                                    |
      | atl1102                                                                                  |
      | bbibp-corv vaccine                                                                       |
      | belcesiran                                                                               |
      | betamethasone valerate plus clioquinol                                                   |
      | bidridistrogene xeboparvovec                                                             |
      | bismuth salicylate plus metronidazole plus tetracycline                                  |
      | bomtabegagene bavoparvovec                                                               |
      | Brazilian green propolis                                                                 |
      | Brazilian green propolis extract                                                         |
      | Caesalpinia spinosa extract                                                              |
      | camizestrant                                                                             |
      | celecoxib plus ciprofloxacin                                                             |
      | cepadacursen sodium                                                                      |
      | cimdelirsen                                                                              |
      | comirnaty                                                                                |
      | convidicea                                                                               |
      | cpp 115                                                                                  |
      | crn04777                                                                                 |
      | dabocemagene autoficel                                                                   |
      | dexmethylphenidate plus serdexmethylphenidate                                            |
      | dexpanthenol plus xylometazoline                                                         |
      | drospirenone plus estetrol                                                               |
      | elasomeran                                                                               |
      | elranatamab                                                                              |
      | estradiol plus norethisterone acetate plus relugolix                                     |
      | feline calicivirosis feline leukemia feline panleukopenia feline rhinotracheitis vaccine |
      | foscarbidopa plus foslevodopa                                                            |
      | frenlosirsen                                                                             |
      | hm04                                                                                     |
      | idestopoetin alfa                                                                        |
      | ilunocitinib                                                                             |
      | infectious bursal disease Newcastle disease vaccine                                      |
      | ion283                                                                                   |
      | ipn60130                                                                                 |
      | lexanersen                                                                               |
      | lilotomab tetraxetan lutetium lu 177                                                     |
      | lotilaner plus milbemycin oxime                                                          |
      | lovotibeglogene autotemcel                                                               |
      | luxeptinib                                                                               |
      | marnetegragene autotemcel                                                                |
      | mb 107                                                                                   |
      | meplazumab                                                                               |
      | mezigdomide                                                                              |
      | mivorilaner                                                                              |
      | mometasone furoate plus olopatadine                                                      |
      | mozafancogene autotemcel                                                                 |
      | mupadolimab                                                                              |
      | ngn-aga                                                                                  |
      | nnz 2591                                                                                 |
      | novaferon                                                                                |
      | olanzapine plus samidorphan                                                              |
      | olezarsen                                                                                |
      | oncos 102                                                                                |
      | orphenadrine citrate plus paracetamol                                                    |
      | oxabact                                                                                  |
      | p 1037                                                                                   |
      | pbgm01                                                                                   |
      | pbp1510                                                                                  |
      | pegsitacianine                                                                           |
      | peys611                                                                                  |
      | pf 06823859                                                                              |
      | piflufolastat f 18                                                                       |
      | pirtobrutinib                                                                            |
      | pr006a                                                                                   |
      | propolis extract                                                                         |
      | proxalutamide                                                                            |
      | pyroglutamylasparaginylprolyl dextro tyrosyl dextro tryptophanamide                      |
      | recombinant laminin 111                                                                  |
      | rmc 035                                                                                  |
      | ro7248824                                                                                |
      | ropsacitinib                                                                             |
      | rovanersen                                                                               |
      | rusfertide                                                                               |
      | sabizabulin                                                                              |
      | sig 001                                                                                  |
      | simufilam                                                                                |
      | sirpiglenastat                                                                           |
      | sputnik v vaccine                                                                        |
      | tara gum                                                                                 |
      | temuterkib                                                                               |
      | trotabresib                                                                              |
      | ubamatamab                                                                               |
      | ux701                                                                                    |
      | vaxzevria                                                                                |
      | vebreltinib                                                                              |
      | vusolimogene oderparepvec                                                                |
      | vxm01                                                                                    |
      | wibp-corv vaccine                                                                        |
      | zalunfiban                                                                               |
      | zedenoleucel                                                                             |
      | zevorcabtagene autoleucel                                                                |
      | zifivax                                                                                  |
      | 11/9 cell line                                                                           |
      | 293-hMyD88 cell line                                                                     |
      | 293-SARS2-S cell line                                                                    |
      | 293-SARS2-S-dfur cell line                                                               |
      | 293/ACE2 cell line                                                                       |
      | 293T/ACE2 cell line                                                                      |
      | 3A1 cell line                                                                            |
      | 3A2 [Mouse hybridoma against SARS-CoV-2 spike] cell line                                 |
      | 3A6 cell line                                                                            |
      | 3A7 cell line                                                                            |
      | 3B1 cell line                                                                            |
      | 3B3 [Mouse hybridoma against SARS-CoV-2 spike] cell line                                 |
      | 3B4 cell line                                                                            |
      | 3B6 [Mouse hybridoma against SARS-CoV-2 spike] cell line                                 |
      | 3C2 [Mouse hybridoma against SARS-CoV-2 spike] cell line                                 |
      | 3C4 cell line                                                                            |
      | 3C6 [Mouse hybridoma against SARS-CoV-2 spike] cell line                                 |
      | 3D1 [Mouse hybridoma against SARS-CoV-2 spike] cell line                                 |
      | 3D2 [Mouse hybridoma against SARS-CoV-2 spike] cell line                                 |
      | 3D3 [Mouse hybridoma against SARS-CoV-2 spike] cell line                                 |
      | 3D5 [Mouse hybridoma against SARS-CoV-2 spike] cell line                                 |
      | 3D7 cell line                                                                            |
      | 3E1 [Mouse hybridoma against SARS-CoV-2 spike] cell line                                 |
      | 3E4 [Mouse hybridoma against SARS-CoV-2 spike] cell line                                 |
      | 3E5 cell line                                                                            |
      | 3F1 cell line                                                                            |
      | 3F2 [Mouse hybridoma against SARS-CoV-2 spike] cell line                                 |
      | 3F4 [Mouse hybridoma against SARS-CoV-2 spike] cell line                                 |
      | 3F5 [Mouse hybridoma against SARS-CoV-2 spike] cell line                                 |
      | 3F6 [Mouse hybridoma against SARS-CoV-2 spike] cell line                                 |
      | 3G1 [Mouse hybridoma against SARS-CoV-2 spike] cell line                                 |
      | 3G2 [Mouse hybridoma against SARS-CoV-2 spike] cell line                                 |
      | 3G6 [Mouse hybridoma against SARS-CoV-2 spike] cell line                                 |
      | 3G7 cell line                                                                            |
      | 3H2 cell line                                                                            |
      | 3H4 cell line                                                                            |
      | 3H6 cell line                                                                            |
      | 5A1 [Mouse hybridoma against SARS-CoV-2 spike] cell line                                 |
      | 9F2 cell line                                                                            |
      | A549-Dual cell line                                                                      |
      | A549-Dual hACE2-TMPRSS2 cell line                                                        |
      | A549-Dual KO-MDA5 cell line                                                              |
      | A549-Dual KO-MDA5 hACE2-TMPRSS2 cell line                                                |
      | A549-Dual KO-RIG-I cell line                                                             |
      | A549-Dual KO-RIG-I hACE2-TMPRSS2 cell line                                               |
      | A549-hACE2 (HA-FLAG) cell line                                                           |
      | A549-hACE2 [BEI resources] cell line                                                     |
      | A549-hACE2 [Invivogen] cell line                                                         |
      | A549-hACE2-TMPRSS2 cell line                                                             |
      | Aa23 cell line                                                                           |
      | acquired thrombotic thrombocytopenic purpura                                             |
      | acromioplasty                                                                            |
      | acute toxoplasmosis                                                                      |
      | adamantinomatous craniopharyngioma                                                       |
      | adenoameloblastoma                                                                       |
      | adhesive arachnoiditis                                                                   |
      | aerotaxis                                                                                |
      | affinity purification                                                                    |
      | agricultural chemistry                                                                   |
      | agricultural science                                                                     |
      | agronomics                                                                               |
      | allergic fungal sinusitis                                                                |
      | alveolar echinococcosis                                                                  |
      | amebic meningoencephalitis                                                               |
      | amegakaryocytic thrombocytopenia                                                         |
      | ameloblastic fibroma                                                                     |
      | amphotropic virus                                                                        |
      | amphotropism                                                                             |
      | anatomical location                                                                      |
      | anatomical topography                                                                    |
      | Angiostrongylus vasorum infection                                                        |
      | anti NMDA receptor encephalitis                                                          |
      | applied science                                                                          |
      | arteriolar hyalinosis                                                                    |
      | arthroscopic acromioplasty                                                               |
      | arthroscopic Bankart repair                                                              |
      | arthroscopic capsular release                                                            |
      | arthroscopic lavage                                                                      |
      | arthroscopic meniscectomy                                                                |
      | arthroscopic remplissage                                                                 |
      | arthroscopic rotator cuff repair                                                         |
      | arthroscopic synovectomy                                                                 |
      | Aspergillus sinusitis                                                                    |
      | Aspergillus sojae                                                                        |
      | atheromatous plaque                                                                      |
      | atlas fracture                                                                           |
      | atypical hemolytic uraemic syndrome                                                      |
      | atypical hemolytic uremic syndrome                                                       |
      | augmentative and alternative communication                                               |
      | augmentative communication system                                                        |
      | autoclaving                                                                              |
      | autoimmune encephalitis                                                                  |
      | autoimmune encephalomyelitis                                                             |
      | autoimmune limbic encephalitis                                                           |
      | autoimmune meningoencephalitis                                                           |
      | autoimmune neutropenia                                                                   |
      | autoimmune thrombocytopenia                                                              |
      | availability bias                                                                        |
      | average daily gain                                                                       |
      | axis fracture                                                                            |
      | azoxymethane-induced colon carcinogenesis                                                |
      | BA886 cell line                                                                          |
      | Bacillus thuringiensis berliner                                                          |
      | bacterial encephalitis                                                                   |
      | bacterial meningoencephalitis                                                            |
      | bandwidth                                                                                |
      | Bankart repair                                                                           |
      | basic science                                                                            |
      | behavioral immune system                                                                 |
      | Bickerstaff brainstem encephalitis                                                       |
      | bifascicular block                                                                       |
      | biliary cannulation                                                                      |
      | bimalleolar fracture                                                                     |
      | bioinorganic chemistry                                                                   |
      | biomechanical software                                                                   |
      | biopreservation                                                                          |
      | biphobia                                                                                 |
      | blood clotting factor 13 test kit                                                        |
      | breast ductal carcinoma                                                                  |
      | bronchopulmonary aspergillosis                                                           |
      | Brostrom procedure                                                                       |
      | buckle fracture                                                                          |
      | buffalopox                                                                               |
      | burst fracture                                                                           |
      | Caesalpinia spinosa                                                                      |
      | calcifying epithelial odontogenic tumor                                                  |
      | calcifying odontogenic cyst                                                              |
      | camelpox                                                                                 |
      | Campylobacter fetus infection                                                            |
      | cardiopulmonary bypass system valve                                                      |
      | cell tropism                                                                             |
      | cellular imaging software                                                                |
      | cementoma                                                                                |
      | central nervous system histoplasmosis                                                    |
      | cerebral cryptococcosis                                                                  |
      | chalkbrood                                                                               |
      | Chance fracture                                                                          |
      | chemical meningitis                                                                      |
      | chemical sterilization                                                                   |
      | chemosensing                                                                             |
      | chemotherapy-induced febrile neutropenia                                                 |
      | child day care                                                                           |
      | Chlamydia pneumoniae test kit                                                            |
      | Chlorobium limicola                                                                      |
      | Chloroflexus aurantiacus                                                                 |
      | Chronic bee paralysis virus                                                              |
      | chronic encephalitis                                                                     |
      | claw hand                                                                                |
      | clay shoveler's fracture                                                                 |
      | climate engineering                                                                      |
      | cocaine test kit                                                                         |
      | coccygectomy                                                                             |
      | coimmunoprecipitation                                                                    |
      | collagen test kit                                                                        |
      | communication board                                                                      |
      | communication technology                                                                 |
      | comparative psychology                                                                   |
      | complement component C2 test kit                                                         |
      | congenital amegakaryocytic thrombocytopenia                                              |
      | context effect                                                                           |
      | corpectomy                                                                               |
      | Corynebacterium pseudotuberculosis infection                                             |
      | costotransversectomy                                                                     |
      | cotinine test kit                                                                        |
      | COVID-19 vaccine-induced immune thrombotic thrombocytopenia                              |
      | COVID-19-associated meningoencephalitis                                                  |
      | crosslinking immunoprecipitation                                                         |
      | crush fracture                                                                           |
      | cryptococcal meningoencephalitis                                                         |
      | cultural background                                                                      |
      | cultural identity                                                                        |
      | cutaneous anthrax                                                                        |
      | cutaneous gamma delta T cell lymphoma                                                    |
      | cutaneous histoplasmosis                                                                 |
      | cyclic thrombocytopenia                                                                  |
      | cytomegalovirus encephalitis                                                             |
      | death toll                                                                               |
      | decannulation                                                                            |
      | deformed wing virus                                                                      |
      | dental fee                                                                               |
      | dentigerous cyst                                                                         |
      | dentinogenic ghost cell tumor                                                            |
      | depressed skull fracture                                                                 |
      | Desulfovibrio vulgaris Hildenborough                                                     |
      | Desulfovibrio vulgaris Miyazaki F                                                        |
      | diagnostic bias                                                                          |
      | differential expression analysis                                                         |
      | differential gene expression                                                             |
      | differential psychology                                                                  |
      | diffusion of innovation                                                                  |
      | digestible indispensable amino acid score                                                |
      | discrimination against sexual and gender minorities                                      |
      | dispensing fee                                                                           |
      | distal clavicle resection                                                                |
      | double door laminoplasty                                                                 |
      | drug-induced akathisia                                                                   |
      | dry heat sterilization                                                                   |
      | ductal carcinoma                                                                         |
      | durotaxis                                                                                |
      | eco-anxiety                                                                              |
      | ecological diversity                                                                     |
      | ecological psychology                                                                    |
      | economic inequality                                                                      |
      | ecotropism                                                                               |
      | educational psychology                                                                   |
      | electrolaryngeal speech                                                                  |
      | electrolarynx                                                                            |
      | electroneuromyography                                                                    |
      | electrosensing                                                                           |
      | electrotaxis                                                                             |
      | embryo assessment software                                                               |
      | en bloc resection                                                                        |
      | encephalomyocarditis                                                                     |
      | end-diastolic velocity                                                                   |
      | enterohemorrhagic Escherichia coli infection                                             |
      | enterovirus meningitis                                                                   |
      | enterovirus meningoencephalitis                                                          |
      | Epstein-Barr virus encephalitis                                                          |
      | escape mutant                                                                            |
      | escape mutation                                                                          |
      | Escherichia coli meningitis                                                              |
      | Escherichia coli test kit                                                                |
      | Escherichia fergusonii                                                                   |
      | esophageal speech                                                                        |
      | ethanol-induced neurotoxicity                                                            |
      | ethnic background                                                                        |
      | ethnic identity                                                                          |
      | Evans syndrome                                                                           |
      | evolutionary psychology                                                                  |
      | evolvability                                                                             |
      | excess mortality                                                                         |
      | exosome isolation kit                                                                    |
      | experimental autoimmune encephalitis                                                     |
      | experimental memory impairment                                                           |
      | experimental salmonellosis                                                               |
      | extreme poverty                                                                          |
      | facetectomy                                                                              |
      | fading affect bias                                                                       |
      | fatty streak                                                                             |
      | fear of death                                                                            |
      | fibroatheroma                                                                            |
      | fibroblast growth factor receptor test kit                                               |
      | fight or flight response                                                                 |
      | fish tank granuloma                                                                      |
      | flood insurance                                                                          |
      | flow cytometry software                                                                  |
      | fourchette                                                                               |
      | fracture infection                                                                       |
      | frenectomy                                                                               |
      | frontobasal fracture                                                                     |
      | functional diversity                                                                     |
      | functional enrichment analysis                                                           |
      | fungal meningoencephalitis                                                               |
      | gain to feed ratio                                                                       |
      | gamma delta T cell lymphoma                                                              |
      | gastrin test kit                                                                         |
      | gender diversity                                                                         |
      | gender inequality                                                                        |
      | gene electrotransfer                                                                     |
      | gene set analysis                                                                        |
      | gene set enrichment analysis                                                             |
      | gene set variation analysis                                                              |
      | genioglossus advancement                                                                 |
      | genital actinomycosis                                                                    |
      | genomic analysis software                                                                |
      | geoengineering                                                                           |
      | geotechnical engineering                                                                 |
      | Gini coefficient                                                                         |
      | Girdlestone procedure                                                                    |
      | glucose electrode                                                                        |
      | gravitaxis                                                                               |
      | greenstick fracture                                                                      |
      | GST pull-down                                                                            |
      | Haemophilus influenzae test kit                                                          |
      | Haemophilus influenzae type b meningitis                                                 |
      | hangman's fracture                                                                       |
      | haptotaxis                                                                               |
      | Hashimoto encephalitis                                                                   |
      | heat sterilization                                                                       |
      | HEK-293T-hACE2 cell line                                                                 |
      | HEK-Blue hACE2 cell line                                                                 |
      | HEK-Blue Null1-v cell line                                                               |
      | HEK293SF cell line                                                                       |
      | HEK293SF-3F6 cell line                                                                   |
      | HEK293T SARS-CoV-2 Spike cell line                                                       |
      | hepatosplenic gamma delta T cell lymphoma                                                |
      | hepatosplenic T cell lymphoma                                                            |
      | Herbaspirillum seropedicae                                                               |
      | herd immunity threshold                                                                  |
      | herpes simplex meningitis                                                                |
      | herpes simplex meningoencephalitis                                                       |
      | herpetic encephalitis                                                                    |
      | high frequency irreversible electroporation                                              |
      | high pressure processing                                                                 |
      | high-cost technology                                                                     |
      | high-fat diet-induced inflammation                                                       |
      | His bundle block                                                                         |
      | His bundle pacing                                                                        |
      | HITS-CLIP                                                                                |
      | HIV encephalitis                                                                         |
      | HIV-associated cryptococcal meningitis                                                   |
      | HIV-associated encephalitis                                                              |
      | HIV-associated meningitis                                                                |
      | Hollenhorst plaque                                                                       |
      | host tropism                                                                             |
      | human diversity                                                                          |
      | human herpesvirus 6 encephalitis                                                         |
      | hypertrophic pachymeningitis                                                             |
      | iCLIP (immunoprecipitation)                                                              |
      | idiopathic hypertrophic pachymeningitis                                                  |
      | Iflaviridae                                                                              |
      | Iflavirus                                                                                |
      | ilium fracture                                                                           |
      | illusion of control                                                                      |
      | illusory correlation                                                                     |
      | immunoinformatics                                                                        |
      | impaction fracture                                                                       |
      | income distribution                                                                      |
      | income inequality                                                                        |
      | infantile amnesia                                                                        |
      | infectious limbic encephalitis                                                           |
      | infectious meningitis                                                                    |
      | influenza encephalitis                                                                   |
      | infusion pump software                                                                   |
      | inhalational anthrax                                                                     |
      | inhibin test kit                                                                         |
      | insufficiency fracture                                                                   |
      | insulin test kit                                                                         |
      | intermittent exposure                                                                    |
      | interposition arthroplasty                                                               |
      | intersectionality                                                                        |
      | intestinal T cell lymphoma                                                               |
      | invasive pulmonary aspergillosis                                                         |
      | ionomics                                                                                 |
      | IPLB-LD-65 cell line                                                                     |
      | IPLB-LD-65Y cell line                                                                    |
      | Jefferson fracture                                                                       |
      | joint capsulorrhaphy                                                                     |
      | K562/GM-CSF cell line                                                                    |
      | keratocyst                                                                               |
      | Koala retrovirus                                                                         |
      | laboratory analyzer operation system                                                     |
      | lactational exposure                                                                     |
      | laminotomy                                                                               |
      | Le Fort fracture                                                                         |
      | lean meat percentage                                                                     |
      | Leptolyngbya boryana                                                                     |
      | leptomeningitis                                                                          |
      | leptospiral meningitis                                                                   |
      | limbic encephalitis                                                                      |
      | Lisfranc fracture                                                                        |
      | Listeria encephalitis                                                                    |
      | Listeria meningoencephalitis                                                             |
      | locus control region                                                                     |
      | long COVID                                                                               |
      | long term care insurance                                                                 |
      | lumbar spine fracture                                                                    |
      | lysosomal trapping                                                                       |
      | magnetomyography                                                                         |
      | magnetoreceptor                                                                          |
      | magnetosensing                                                                           |
      | magnetotaxis                                                                             |
      | maxillary advancement                                                                    |
      | maxillomandibular advancement                                                            |
      | MDOK cell line                                                                           |
      | measles encephalitis                                                                     |
      | mechanosensing                                                                           |
      | mechanotaxis                                                                             |
      | mental fatigue                                                                           |
      | MERS virus test kit                                                                      |
      | microangiopathic hemolytic anemia                                                        |
      | microdiscectomy                                                                          |
      | microfracture (injury)                                                                   |
      | microfracture (procedure)                                                                |
      | microsporidial keratitis                                                                 |
      | microwave sterilization                                                                  |
      | midface fracture                                                                         |
      | milkers nodule                                                                           |
      | misinformation effect                                                                    |
      | mitral annular plane systolic excursion                                                  |
      | Mollaret meningitis                                                                      |
      | Mondor's disease                                                                         |
      | monocyte lymphocyte ratio                                                                |
      | monomorphic epitheliotropic intestinal T cell lymphoma                                   |
      | MRI guided linear accelerator                                                            |
      | mumps encephalitis                                                                       |
      | mumps meningitis                                                                         |
      | mumps meningoencephalitis                                                                |
      | Mycobacterium leprae test kit                                                            |
      | national identity                                                                        |
      | needle electromyography                                                                  |
      | neonatal pneumothorax                                                                    |
      | neonatal respiratory failure                                                             |
      | nerve root resection                                                                     |
      | neural leprosy                                                                           |
      | neurodisability                                                                          |
      | neurodiversity                                                                           |
      | neurotropic virus                                                                        |
      | Nitrobacter winogradskyi                                                                 |
      | non-paraneoplastic limbic encephalitis                                                   |
      | nonthermal irreversible electroporation                                                  |
      | nucleic acid genotyping array kit                                                        |
      | nucleic acid library preparation kit                                                     |
      | nucleic acid sequencing kit                                                              |
      | nursing fee                                                                              |
      | OA3.Ts cell line                                                                         |
      | ocular larva migrans                                                                     |
      | open Bankart repair                                                                      |
      | open door laminoplasty                                                                   |
      | operator region                                                                          |
      | orbital anthrax                                                                          |
      | orbital floor                                                                            |
      | orbital floor fracture                                                                   |
      | orbital roof                                                                             |
      | orbital roof fracture                                                                    |
      | overconfidence                                                                           |
      | overestimation bias                                                                      |
      | overrepresentation analysis                                                              |
      | pachymeningitis                                                                          |
      | Paenibacillus amylolyticus                                                               |
      | Paeniclostridium                                                                         |
      | pancreatic ductal carcinoma                                                              |
      | panfacial fracture                                                                       |
      | Pangolin coronavirus                                                                     |
      | Pantoea ananatis                                                                         |
      | papillary craniopharyngioma                                                              |
      | PAR-CLIP                                                                                 |
      | parametric analysis of gene set enrichment                                               |
      | paraneoplastic encephalitis                                                              |
      | paraneoplastic encephalomyelitis                                                         |
      | paraneoplastic limbic encephalitis                                                       |
      | parasitic encephalitis                                                                   |
      | parasitic meningoencephalitis                                                            |
      | pathological lying                                                                       |
      | pathway enrichment analysis                                                              |
      | penile frenulum                                                                          |
      | penile Mondor's disease                                                                  |
      | PER.C6 TetR cell line                                                                    |
      | performance bias                                                                         |
      | perinatal exposure                                                                       |
      | periodontal cyst                                                                         |
      | personality psychology                                                                   |
      | pharmacy fee                                                                             |
      | phlegmasia alba dolens                                                                   |
      | phlegmasia cerulea dolens                                                                |
      | photosensing                                                                             |
      | phrenectomy                                                                              |
      | phylodynamics                                                                            |
      | pilon fracture                                                                           |
      | plasma ablation system                                                                   |
      | polarotaxis                                                                              |
      | political identity                                                                       |
      | polysomnography software                                                                 |
      | positive illusion                                                                        |
      | positivity bias                                                                          |
      | poverty level                                                                            |
      | preadipocyte cell line                                                                   |
      | prescribing practice                                                                     |
      | pressure sterilization                                                                   |
      | primacy effect                                                                           |
      | pristane-induced systemic lupus erythematosus                                            |
      | pro-environmental behavior                                                               |
      | problem oriented medical record                                                          |
      | property insurance                                                                       |
      | prosody                                                                                  |
      | protein creatinine ratio                                                                 |
      | protein digestibility corrected amino acid score                                         |
      | protein isolation kit                                                                    |
      | proteochemometrics                                                                       |
      | psychedelic therapy                                                                      |
      | pubis fracture                                                                           |
      | pull-down assay                                                                          |
      | pulmonary histoplasmosis                                                                 |
      | purchasing power                                                                         |
      | R05T cell line                                                                           |
      | R06E cell line                                                                           |
      | R15-Spike cell line                                                                      |
      | R22-Spike cell line                                                                      |
      | R31-Spike cell line                                                                      |
      | R52-Spike cell line                                                                      |
      | racial background                                                                        |
      | racial disparity                                                                         |
      | racial diversity                                                                         |
      | racial identity                                                                          |
      | recency effect                                                                           |
      | religious background                                                                     |
      | religious identity                                                                       |
      | reminiscence bump                                                                        |
      | resection arthroplasty                                                                   |
      | respiratory virus test kit                                                               |
      | Reston ebolavirus                                                                        |
      | resurfacing arthroplasty                                                                 |
      | reverse transcriptase PCR assay kit                                                      |
      | reversible electroporation                                                               |
      | rheotaxis                                                                                |
      | rigidity sensing                                                                         |
      | RNA immunoprecipitation                                                                  |
      | RNA interference assay kit                                                               |
      | RNA pull-down                                                                            |
      | rotationplasty                                                                           |
      | rotator cuff repair                                                                      |
      | rubella panencephalitis                                                                  |
      | S1D7-Spike cell line                                                                     |
      | S3D8-Spike cell line                                                                     |
      | sacbrood virus                                                                           |
      | sacrectomy                                                                               |
      | sacrum fracture                                                                          |
      | sample lysis equipment                                                                   |
      | sample processing kit                                                                    |
      | sample stabilization kit                                                                 |
      | SARS-CoV-2 (clinical isolate Australia/QLD02/2020)                                       |
      | SARS-CoV-2 (clinical isolate Belgium/GHB-03021/2020)                                     |
      | SARS-CoV-2 (clinical isolate BetaCoV/Munich/BavPat1/2020)                                |
      | SARS-CoV-2 (clinical isolate human/NLD/Nijmegen1/2020)                                   |
      | SARS-CoV-2 (clinical isolate Italy-INMI1)                                                |
      | SARS-CoV-2 (clinical isolate PIK35)                                                      |
      | SARS-CoV-2 (Germany/FI1103201/2020 (EPI-ISL 463008, D614G))                              |
      | SARS-CoV-2 (human/tc/India/2020/Hisar-4907)                                              |
      | SARS-CoV-2 (isolate ICGEB-FVG 5)                                                         |
      | SARS-CoV-2 (strain BetaCoV/wuhan/AMMS01/2020)                                            |
      | SARS-CoV-2 (strain hCoV-19/CHN/SYSU-IHV/2020)                                            |
      | SARS-CoV-2 (strain JPN/NGS/IA-1/2020)                                                    |
      | SARS-CoV-2 (strain NL/2020)                                                              |
      | SARS-CoV-2 (strain PR-1)                                                                 |
      | SARS-CoV-2 variant VUI-21APR-01                                                          |
      | SARS-CoV-2 virus (HRB26/human/2020/CHN)                                                  |
      | Schneider 2 cell line                                                                    |
      | sciCHO cell line                                                                         |
      | sciCHO:hACE2 cell line                                                                   |
      | sciCHO:hACE2:hTMPRSS2 cell line                                                          |
      | scientometrics                                                                           |
      | scleroderma renal crisis                                                                 |
      | scopolamine-induced memory impairment                                                    |
      | scototaxis                                                                               |
      | sectional anatomy                                                                        |
      | septic thrombophlebitis                                                                  |
      | serial position effect                                                                   |
      | serotype prevalence                                                                      |
      | Sf9 SARS-CoV-2 Spike S1 cell line                                                        |
      | Sf9 SARS-CoV-2 Spike S2 cell line                                                        |
      | Sf900+ cell line                                                                         |
      | short term exposure                                                                      |
      | single fiber electromyography                                                            |
      | social anxiety                                                                           |
      | social identity                                                                          |
      | social inequality                                                                        |
      | social preference                                                                        |
      | social value                                                                             |
      | socioeconomic background                                                                 |
      | socioeconomic distribution                                                               |
      | Sp2/mIL-6 cell line                                                                      |
      | spacing effect                                                                           |
      | speech generating device                                                                 |
      | spiral fracture                                                                          |
      | stair lift                                                                               |
      | stand up chair                                                                           |
      | steam sterilization                                                                      |
      | sternum fracture                                                                         |
      | Streptococcus vestibularis                                                               |
      | subdural abscess                                                                         |
      | surface electromyography                                                                 |
      | talectomy                                                                                |
      | Tb 1 Lu cell line                                                                        |
      | temporal bone fracture                                                                   |
      | terminator sequence                                                                      |
      | thermal hypoalgesia                                                                      |
      | thermotaxis                                                                              |
      | thigmotaxis                                                                              |
      | thoracic fracture                                                                        |
      | thoracic spine fracture                                                                  |
      | thoracic sympathectomy                                                                   |
      | thoracolumbar burst fracture                                                             |
      | thoracolumbar fracture                                                                   |
      | Thoracolumbar Injury Classification and Severity score                                   |
      | thrombocytopenic purpura-hemolytic uremic syndrome                                       |
      | thrombophlebitis migrans                                                                 |
      | thrombotic microangiopathy                                                               |
      | thumb fracture                                                                           |
      | tissue tropism                                                                           |
      | toe fracture                                                                             |
      | tracheoesophageal speech                                                                 |
      | tracheostomy decannulation                                                               |
      | transcriptome analysis software                                                          |
      | transmit power                                                                           |
      | transphobia                                                                              |
      | trifascicular block                                                                      |
      | triple arthrodesis                                                                       |
      | tuberculous meningoencephalitis                                                          |
      | tubulogenesis                                                                            |
      | Upshaw-Schulman syndrome                                                                 |
      | vaccine-induced immune thrombotic thrombocytopenia                                       |
      | vacuum manifold                                                                          |
      | value orientation                                                                        |
      | variant of concern                                                                       |
      | variant of interest                                                                      |
      | Vero-B4 cell line                                                                        |
      | Vero/hSLAM cell line                                                                     |
      | Vero/TMPRSS2 cell line                                                                   |
      | vertebral body fracture                                                                  |
      | vertebral pedicle fracture                                                               |
      | video surveillance                                                                       |
      | viral diversity                                                                          |
      | viral meningoencephalitis                                                                |
      | vision insurance                                                                         |
      | vulnerable plaque                                                                        |
      | WAe001-A-58 cell line                                                                    |
      | Waterhouse-Friderichsen syndrome                                                         |
      | wealth distribution                                                                      |
      | wealth inequality                                                                        |
      | Weissella paramesenteroides                                                              |
      | XTC-2 cell line                                                                          |
      | Yersinia enterocolitica test kit                                                         |
      | zygomaticomaxillary complex fracture                                                     |


  @EmtreeWipModified
  Scenario Outline: Verify that changed Emtree terms from 2021.03 have been replaced

    Given I set the endpoint for the http request to /rest/searchquery/term/autocomplete
    And I set the queryParam term with value <newTerm>
    And I set the queryParam limit with value 10
    And I set a valid SESSION cookie
    When I execute the http request with method GET
    And the status code of the response is 200
    And the first suggested term is <newTerm>
    And I extract the prefTermId
    Given I set the endpoint for the http request to /rest/emtree/
    And I concatenate the extracted prefTermId to the URL
    And I concatenate the value /info to the URL
    And I set a valid SESSION cookie
    When I execute the http request with method GET
    And the status code of the response is 200
    Then the response body contains synonym <oldTerm>

    Examples:
      | newTerm                                                                                         | oldTerm                                                   |
      | acetylsalicylic acid plus caffeine                                                              | anacin                                                    |
      | acetylsalicylic acid plus ethoheptazine plus meprobamate                                        | equagesic                                                 |
      | afamitresgene autoleucel                                                                        | adp a2m4                                                  |
      | belcesiran                                                                                      | dcr s1459                                                 |
      | bicarbonate plus macrogol 3350 plus potassium chloride plus sodium chloride plus sodium sulfate | colyte                                                    |
      | bismuth salicylate plus metronidazole plus tetracycline                                         | helidac                                                   |
      | comirnaty                                                                                       | tozinameran                                               |
      | convidicea                                                                                      | ad5 ncov vaccine                                          |
      | coronavac                                                                                       | picovacc vaccine                                          |
      | elasomeran                                                                                      | mRNA-1273 vaccine                                         |
      | lilotomab tetraxetan lutetium lu 177                                                            | tetulomab tetraxetan lutetium lu 177                      |
      | orphenadrine citrate plus paracetamol                                                           | norgesic                                                  |
      | recombinant blood clotting factor 8                                                             | bivv 001                                                  |
      | sputnik v vaccine                                                                               | gam-covid-vac                                             |
      | vaxzevria                                                                                       | chadox1 ncov 19                                           |
      | zevorcabtagene autoleucel                                                                       | ct053                                                     |
      | acetylsalicylic acid plus caffeine                                                              | anacin                                                    |
      | acetylsalicylic acid plus ethoheptazine plus meprobamate                                        | equagesic                                                 |
      | anti NMDA receptor encephalitis                                                                 | anti n methyl d aspartate receptor encephalitis           |
      | augmentative and alternative communication                                                      | facilitated communication                                 |
      | autoimmune encephalitis                                                                         | allergic encephalitis                                     |
      | autoimmune encephalomyelitis                                                                    | allergic encephalomyelitis                                |
      | biomechanical software                                                                          | biomechanical function analysis/rehabilitation software   |
      | Bipolaris                                                                                       | Cochliobolus                                              |
      | bodily secretions                                                                               | fluor                                                     |
      | cellular imaging software                                                                       | cancer cell marker/morphology image-analysis software IVD |
      | embryo assessment software                                                                      | embryo assessment microscope camera system software       |
      | esophageal speech                                                                               | esophagus speech                                          |
      | experimental autoimmune encephalitis                                                            | experimental allergic encephalitis                        |
      | Filovirus                                                                                       | Filoviridae                                               |
      | genomic analysis software                                                                       | human genomic analysis interpretive software              |
      | infusion pump software                                                                          | infusion pump medication dosage software                  |
      | keratocyst                                                                                      | odontogenic keratocyst                                    |
      | laboratory analyzer operation system                                                            | laboratory analyzer operation system software             |
      | microfracture (procedure)                                                                       | microfracture                                             |
      | monocyte lymphocyte ratio                                                                       | monocyte to lymphocyte ratio                              |
      | operator region                                                                                 | operator gene                                             |
      | Polyporaceae                                                                                    | Coriolaceae                                               |
      | polysomnography software                                                                        | polysomnography device software                           |
      | pristane-induced systemic lupus erythematosus                                                   | pristane-induced lupus                                    |
      | protein creatinine ratio                                                                        | protein to creatinine ratio                               |
      | scopolamine-induced memory impairment                                                           | scopolamine-induced amnesia                               |


