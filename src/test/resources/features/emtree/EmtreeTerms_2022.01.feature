@api @BE @skip @emtree_2022
Feature: Emtree-2022.01

  Background:
    Given I set the endpoint for the http request to /mock/login
    And I set the request header Content-Type with value application/json
    And I set the request body with content from file \jsonFiles\mock-sguserdetails.json
    And I execute the http request with method POST
    And I capture cookies from the authentication method

  @C506457
  Scenario Outline: Verify that newly added Emtree terms from 2022.01 are present BE
    Given I set the endpoint for the http request to /rest/searchquery/term/autocomplete
    And I set the queryParam term with value <term>
    And I set the queryParam limit with value 10
    And I set a valid SESSION cookie
    When I execute the http request with method GET
    Then the status code of the response is 200
    And the first suggested term is <term>
    Examples:
      | term                                                                       |
      | acmucabtagene autoleucel                                                   |
      | adintrevimab                                                               |
      | adrulipase alfa                                                            |
      | aguracingene cadoparvovec                                                  |
      | alogabat                                                                   |
      | alrefimotide                                                               |
      | alrefimotide plus riletamotide plus tapderimotide                          |
      | alrizomadlin                                                               |
      | amdizalisib                                                                |
      | amoxicillin plus clarithromycin plus pantoprazole                          |
      | amt 060                                                                    |
      | amubarvimab                                                                |
      | angiomotins                                                                |
      | angiopoietin like protein 8                                                |
      | angiopoietin related protein 1                                             |
      | angiopoietin related protein 2                                             |
      | angiopoietin related protein 3                                             |
      | angiopoietin related protein 5                                             |
      | angiopoietin related protein 6                                             |
      | angiopoietin related protein 7                                             |
      | angiotropin                                                                |
      | anselamimab                                                                |
      | anticoagulant reversal agent                                               |
      | antivirus restriction factor                                               |
      | anumigilimab                                                               |
      | atreg                                                                      |
      | atuliflapon                                                                |
      | atuzabrutinib                                                              |
      | azamidugene autotemcel                                                     |
      | bafisontamab                                                               |
      | barzolvolimab                                                              |
      | bavdegalutamide                                                            |
      | bavunalimab                                                                |
      | baxdrostat                                                                 |
      | bebtelovimab                                                               |
      | beludavimab                                                                |
      | bemnifosbuvir                                                              |
      | benzoyl peroxide plus retinoic acid                                        |
      | bevurogant                                                                 |
      | Boesenbergia rotunda extract                                               |
      | bofelisimer                                                                |
      | botaretigene sparoparvovec                                                 |
      | bralpamide                                                                 |
      | canine distemper virus canine parvovirus vaccine                           |
      | canine parvovirus vaccine                                                  |
      | chloride channel protein 2                                                 |
      | chromobox protein homolog 5                                                |
      | cinaxadamtase alfa                                                         |
      | circulating free DNA                                                       |
      | clesrovimab                                                                |
      | collagen type I alpha 1 chain                                              |
      | competing endogenous RNA                                                   |
      | covlp vaccine                                                              |
      | crefmirlimab                                                               |
      | cyanobacterium toxin                                                       |
      | daclatasvir plus sofosbuvir                                                |
      | dalutrafusp alfa                                                           |
      | davoceticept                                                               |
      | dazucorilant                                                               |
      | deep eutectic solvent                                                      |
      | denifanstat                                                                |
      | designed ankyrin repeat protein                                            |
      | dexamethasone sodium phosphate plus levofloxacin                           |
      | dexepicatechin                                                             |
      | domofenogene zalfaparvovec                                                 |
      | doruxapapogene ralaplasmid                                                 |
      | doublecortin domain protein                                                |
      | doublecortin like kinase                                                   |
      | doublecortin like kinase 1                                                 |
      | doublecortin like kinase 2                                                 |
      | doxecitine                                                                 |
      | dresbuxelimab                                                              |
      | dust mite extract                                                          |
      | eblasakimab                                                                |
      | ecleralimab                                                                |
      | ecteribulin                                                                |
      | efdamrofusp alfa                                                           |
      | eflornithine plus sulindac                                                 |
      | efprezimod alfa                                                            |
      | efzofitimod                                                                |
      | elunonavir                                                                 |
      | emlenoflast                                                                |
      | emodepside plus praziquantel plus tigolaner                                |
      | emprumapimod                                                               |
      | emraclidine                                                                |
      | enalapril maleate plus lercanidipine                                       |
      | endoplasmic reticulum chaperone BiP                                        |
      | ensomafusp alfa                                                            |
      | enuzovimab                                                                 |
      | eragidomide                                                                |
      | ersemadromcel                                                              |
      | escibenzoline                                                              |
      | esmethadone                                                                |
      | etuvetidigene autotemcel                                                   |
      | etzadroxil                                                                 |
      | evexomostat                                                                |
      | evifacotrep                                                                |
      | evixapodlin                                                                |
      | evoncabtagene pazurgedleucel                                               |
      | evorpacept                                                                 |
      | exidavnemab                                                                |
      | ezurpimtrostat                                                             |
      | famitinib                                                                  |
      | farletuzumab ecteribulin                                                   |
      | farudodstat                                                                |
      | fazirsiran                                                                 |
      | fazulemeran                                                                |
      | fidasimtamab                                                               |
      | firolimogene autotemcel                                                    |
      | florquinitau f 18                                                          |
      | fobrepodacin                                                               |
      | formestane plus Sabal extract plus thioctic acid                           |
      | fosgonimeton                                                               |
      | fostroxacitabine bralpamide                                                |
      | fuzuloparib                                                                |
      | gadoquatrane                                                               |
      | galegenimab                                                                |
      | gartisertib                                                                |
      | gefurulimab                                                                |
      | gemnelatinib                                                               |
      | genitourinary agent                                                        |
      | ginisortamab                                                               |
      | golidocitinib                                                              |
      | gresonitamab                                                               |
      | gumokimab                                                                  |
      | gunagratinib                                                               |
      | guraxetan                                                                  |
      | homatropine methylbromide plus hydrocodone bitartrate                      |
      | homeobox protein Nkx-2.2                                                   |
      | horstem                                                                    |
      | Human papilloma virus vaccine                                              |
      | hydroxyapatite plus lidocaine                                              |
      | hydroxyethyl starch                                                        |
      | hydroxymethylglutaryl coenzyme A reductase kinase kinase                   |
      | iclepertin                                                                 |
      | idrevloride                                                                |
      | ifezuntirgene inilparvovec                                                 |
      | imlunestrant                                                               |
      | inaxaplin                                                                  |
      | inobrodib                                                                  |
      | insulin sudelidec                                                          |
      | iodine evuzamitide i 124                                                   |
      | iopofosine i 131                                                           |
      | iparomlimab                                                                |
      | itezocabtagene autoleucel                                                  |
      | ivarmacitinib                                                              |
      | ivicentamab                                                                |
      | ivonescimab                                                                |
      | ivospemin                                                                  |
      | lalikinogene sifuplasmid                                                   |
      | laruparetigene zovaparvovec                                                |
      | ledaborbactam                                                              |
      | ledaborbactam etzadroxil                                                   |
      | lepunafusp alfa                                                            |
      | lerapolturev                                                               |
      | leucine rich repeat protein                                                |
      | ligufalimab                                                                |
      | linvoseltamab                                                              |
      | lisaftoclax                                                                |
      | livmoniplimab                                                              |
      | lixadesiran                                                                |
      | lomtegovimab                                                               |
      | lorigerlimab                                                               |
      | lotazadromcel                                                              |
      | lufepirsen                                                                 |
      | lufotrelvir                                                                |
      | manfidokimab                                                               |
      | mazdutide                                                                  |
      | mazorelvimab                                                               |
      | mazorelvimab plus zamerovimab                                              |
      | mecbotamab                                                                 |
      | mecbotamab vedotin                                                         |
      | melredableukin alfa                                                        |
      | mitochondrial precursor protein import complex protein                     |
      | molybdenum cofactor                                                        |
      | morponidazole                                                              |
      | motacabtagene lurevgedleucel                                               |
      | movronersen                                                                |
      | mu crystallin                                                              |
      | mupirocin                                                                  |
      | nafimestrocel                                                              |
      | neuro oncological ventral antigen                                          |
      | neuronal migration protein doublecortin                                    |
      | nizaracianine                                                              |
      | nofazinlimab                                                               |
      | obefazimod                                                                 |
      | obeversen                                                                  |
      | ocedurenone                                                                |
      | odatroltide                                                                |
      | olitigaltin                                                                |
      | omilancor                                                                  |
      | omzotirome                                                                 |
      | onternabez                                                                 |
      | orenetide                                                                  |
      | organocopper compound                                                      |
      | ormutivimab                                                                |
      | ozuriftamab                                                                |
      | ozuriftamab vedotin                                                        |
      | patidistrogene bexoparvovec                                                |
      | paxlovid                                                                   |
      | PCSK9 inhibitor                                                            |
      | pegipanermin                                                               |
      | pegloxenatide                                                              |
      | pegmolesatide                                                              |
      | pf 07321332                                                                |
      | pivekimab                                                                  |
      | pivekimab sunirine                                                         |
      | pixofisiran                                                                |
      | plutavimab                                                                 |
      | protocadherin                                                              |
      | pruxelutamide                                                              |
      | pulocimab                                                                  |
      | quisovalimab                                                               |
      | rebemadlin                                                                 |
      | recombinant interleukin 1 receptor antagonist                              |
      | rencofilstat                                                               |
      | ribosomal protein L3                                                       |
      | ribosomal protein S9                                                       |
      | riletamotide                                                               |
      | rimteravimab                                                               |
      | rocatinlimab                                                               |
      | romlusevimab                                                               |
      | rosnilimab                                                                 |
      | rst 001                                                                    |
      | rucosopasem manganese                                                      |
      | rugonersen                                                                 |
      | rulonilimab                                                                |
      | ruzinurad                                                                  |
      | SCB 2019 vaccine                                                           |
      | sebetralstat                                                               |
      | selnoflast                                                                 |
      | senotherapeutic agent                                                      |
      | serine threonine protein kinase 3                                          |
      | serine threonine protein kinase D2                                         |
      | shelterin                                                                  |
      | simridarlimab                                                              |
      | sirexatamab                                                                |
      | sirolimus                                                                  |
      | sitocabnagene loxiveleucel                                                 |
      | socazolimab                                                                |
      | sotevtamab                                                                 |
      | sotuletinib                                                                |
      | sovilnesib                                                                 |
      | suciraslimab                                                               |
      | sucunamostat                                                               |
      | sunvozertinib                                                              |
      | SYBR green                                                                 |
      | tagitanlimab                                                               |
      | tamgiblimab                                                                |
      | tapderimotide                                                              |
      | tarcocimab                                                                 |
      | tarcocimab tedromer                                                        |
      | TEA domain transcription factor                                            |
      | tecaginlimab                                                               |
      | teropavimab                                                                |
      | testosterone buciclate                                                     |
      | tg01 (peptide mix)                                                         |
      | three finger toxin                                                         |
      | timtraxanib                                                                |
      | timufermin                                                                 |
      | tizaterkib                                                                 |
      | tozinameran                                                                |
      | transcriptional coactivator with PDZ binding motif protein                 |
      | translationally controlled tumor protein                                   |
      | trinbelimab                                                                |
      | tunlametinib                                                               |
      | tuvonralimab                                                               |
      | tuxobertinib                                                               |
      | ulenistamab                                                                |
      | upanovimab                                                                 |
      | utreloxastat                                                               |
      | vaccine adjuvant                                                           |
      | valiltramiprosate                                                          |
      | vepafestinib                                                               |
      | vepsitamab                                                                 |
      | vesleteplirsen                                                             |
      | vibozilimod                                                                |
      | vidprevtyn                                                                 |
      | vimdemer                                                                   |
      | viperin                                                                    |
      | virus entry inhibitor                                                      |
      | vornorexant                                                                |
      | voxalatamab                                                                |
      | xeligekimab                                                                |
      | xenotropic and polytropic retrovirus receptor                              |
      | xeruborbactam                                                              |
      | YAP signaling protein                                                      |
      | zadavotide guraxetan lutetium lu 177                                       |
      | zamerovimab                                                                |
      | zapnometinib                                                               |
      | zastaprazan                                                                |
      | zavacorilant                                                               |
      | zectivimod                                                                 |
      | zegocractin                                                                |
      | zenuzolac                                                                  |
      | zetomipzomib                                                               |
      | zifanocycline                                                              |
      | ziftomenib                                                                 |
      | zilganersen                                                                |
      | zimlovisertib                                                              |
      | zinc alpha 2 glycoprotein                                                  |
      | zinpentraxin alfa                                                          |
      | zorevunersen                                                               |
      | zunsemetinib                                                               |
      | 4 (methylnitrosamino) 1 (3 pyridyl) 1 butanone-induced lung tumorigenesis  |
      | 5TGM1 cell line                                                            |
      | aardvark (genus)                                                           |
      | abdominal cystic lymphangioma                                              |
      | abdominal lymphangioma                                                     |
      | abdominal lymphoma                                                         |
      | abdominal metastasis                                                       |
      | abyssal zone                                                               |
      | accessory gene                                                             |
      | accessory gene regulator                                                   |
      | accessory genome                                                           |
      | acinic cell carcinoma of the breast                                        |
      | actinic cheilitis                                                          |
      | active avoidance                                                           |
      | activism                                                                   |
      | Addenbrooke cognitive examination                                          |
      | Addenbrooke cognitive examination III                                      |
      | Addenbrooke cognitive examination revised                                  |
      | Adeno-associated dependoparvovirus A                                       |
      | Adeno-associated dependoparvovirus B                                       |
      | Adeno-associated virus 4                                                   |
      | adenoid cystic carcinoma of the breast                                     |
      | adenomyoepithelioma of the breast                                          |
      | Adenovirus 6                                                               |
      | Adenovirus type 40                                                         |
      | adipose-derived mesenchymal stem cell                                      |
      | adrenal pheochromocytoma                                                   |
      | advanced breast cancer                                                     |
      | aedeagus                                                                   |
      | aerosolized particles and droplets                                         |
      | aggregation-induced emission                                               |
      | ALK-negative anaplastic large cell lymphoma                                |
      | ALK-positive anaplastic large cell lymphoma                                |
      | Alkhumra hemorrhagic fever virus                                           |
      | Alphapapillomavirus 2                                                      |
      | Alphapapillomavirus 4                                                      |
      | Alphapapillomavirus 6                                                      |
      | Alphapapillomavirus 8                                                      |
      | Alphapolyomavirus                                                          |
      | Alps                                                                       |
      | Alternative Healthy Eating Index                                           |
      | Alternative Healthy Eating Index 2010                                      |
      | amber codon                                                                |
      | amber mutation                                                             |
      | ambulatory care sensitive condition                                        |
      | ametropia                                                                  |
      | Amyotrophic Lateral Sclerosis Functional Rating Scale                      |
      | Amyotrophic Lateral Sclerosis Functional Rating Scale-Revised              |
      | Anacyclus                                                                  |
      | Anacyclus pyrethrum                                                        |
      | anaerobic chamber                                                          |
      | anal pain                                                                  |
      | Andes                                                                      |
      | angiotensin II-induced cardiac hypertrophy                                 |
      | anisometropic amblyopia                                                    |
      | ankle disease                                                              |
      | ankle stiffness                                                            |
      | antecubital fossa                                                          |
      | anterior cervical corpectomy and fusion                                    |
      | anterior cervical discectomy and fusion                                    |
      | anterior circulation infarction                                            |
      | anterior circulation ischemia                                              |
      | anterior circulation stroke                                                |
      | anticoagulation reversal                                                   |
      | antigenic drift and shift                                                  |
      | antigenic escape                                                           |
      | antimicrobial photodynamic therapy                                         |
      | aortic body tumor                                                          |
      | appendiceal mucinous cystadenoma                                           |
      | appendix endometriosis                                                     |
      | appraisal (mental function)                                                |
      | Aquareovirus                                                               |
      | Aquareovirus C                                                             |
      | aquatic therapy                                                            |
      | arteriole density                                                          |
      | arteriole to venule ratio                                                  |
      | artificial general intelligence                                            |
      | Ashworth scale                                                             |
      | aspiration embolectomy                                                     |
      | ataxia-telangiectasia-like disorder                                        |
      | Atlas Mountains                                                            |
      | atrial septal aneurysm                                                     |
      | atrioventricular septum                                                    |
      | atrioventricular septum aneurysm                                           |
      | attention deficit hyperactivity disorder                                   |
      | atypical squamous cells of the cervix                                      |
      | audio interview                                                            |
      | Australian bat lyssavirus                                                  |
      | authorization                                                              |
      | autonomous vehicle                                                         |
      | autosomal recessive hypercholesterolemia                                   |
      | Avian hepatitis E virus                                                    |
      | Avian leukosis virus - RSA                                                 |
      | Avian leukosis virus subgroup J                                            |
      | avoidant coping                                                            |
      | axial spondyloarthritis                                                    |
      | axillary hyperhidrosis                                                     |
      | balanitis xerotica obliterans                                              |
      | Bandavirus                                                                 |
      | Bannayan-Riley-Ruvalcaba syndrome                                          |
      | barbiturate test kit                                                       |
      | Barrett Joyner Halenda method                                              |
      | bathyal zone                                                               |
      | bathymetry                                                                 |
      | Bathymodiolus                                                              |
      | Bazex syndrome                                                             |
      | bedrock                                                                    |
      | behavioral disinhibition                                                   |
      | benign breast disease                                                      |
      | benign cardiac tumor                                                       |
      | Bentall procedure                                                          |
      | benzo[a]pyrene-induced lung carcinogenesis                                 |
      | benzodiazepine test kit                                                    |
      | Betapapillomavirus 1                                                       |
      | Betapapillomavirus 2                                                       |
      | Betapolyomavirus                                                           |
      | bicinchoninic acid assay                                                   |
      | bilateral diffuse uveal melanocytic proliferation                          |
      | bilateral neoplasm                                                         |
      | biologic license application                                               |
      | biomolecular condensate                                                    |
      | biosaline agriculture                                                      |
      | biosecurity                                                                |
      | birth cohort                                                               |
      | birth interval                                                             |
      | bladder carcinoma in situ                                                  |
      | bladder endometriosis                                                      |
      | bleeding on probing                                                        |
      | blood flow restriction training                                            |
      | bluetongue virus serotype 8                                                |
      | Blumea balsamifera                                                         |
      | body odor                                                                  |
      | boredom susceptibility                                                     |
      | Borna disease virus 1                                                      |
      | borrelial lymphocytoma                                                     |
      | Box Behnken design                                                         |
      | brachioradialis muscle                                                     |
      | Bradford assay                                                             |
      | brain-gut axis                                                             |
      | brainstem stroke                                                           |
      | breakthrough infection                                                     |
      | breast angiosarcoma                                                        |
      | breast cancer recurrence                                                   |
      | bronchogenic carcinoma                                                     |
      | Brooke-Spiegler syndrome                                                   |
      | Brucea javanica                                                            |
      | Brunauer Emmett Teller method                                              |
      | Calliandra                                                                 |
      | cancer-associated retinopathy                                              |
      | Candidatus Bathyarchaeota                                                  |
      | Candidatus Lokiarchaeota                                                   |
      | Candidatus Nanohaloarchaeota                                               |
      | Candidatus Woesearchaeota                                                  |
      | Canine parvovirus type 2                                                   |
      | Canine parvovirus type 2a                                                  |
      | Canine parvovirus type 2b                                                  |
      | Canine parvovirus type 2c                                                  |
      | Canine respiratory coronavirus                                             |
      | cannabinoid test kit                                                       |
      | carbon dioxide emission                                                    |
      | carbon dioxide equivalent                                                  |
      | carbon emission                                                            |
      | carcinoma of the pleura                                                    |
      | cardiac angiosarcoma                                                       |
      | cardiac fibroma                                                            |
      | cardiac hemangioma                                                         |
      | cardiac leiomyosarcoma                                                     |
      | cardiac lymphoma                                                           |
      | cardiac osteosarcoma                                                       |
      | cardiac rhabdomyoma                                                        |
      | cardiac rhabdomyosarcoma                                                   |
      | cardiac teratoma                                                           |
      | Carney triad                                                               |
      | Carney-Stratakis syndrome                                                  |
      | catamenial hemoptysis                                                      |
      | catamenial hemothorax                                                      |
      | catamenial pneumothorax                                                    |
      | catheter embolectomy                                                       |
      | cell electrophoresis                                                       |
      | census tract                                                               |
      | central composite design                                                   |
      | Central Indian Ridge                                                       |
      | central nervous system vasculitis                                          |
      | cerebellar hemangioblastoma                                                |
      | cerebral performance category scale                                        |
      | cervical teratoma                                                          |
      | Charcot Marie Tooth examination score                                      |
      | Charcot Marie Tooth neuropathy score                                       |
      | chatbot                                                                    |
      | chela                                                                      |
      | cheliped                                                                   |
      | chemical exchange saturation transfer                                      |
      | chemigation                                                                |
      | chemisorption                                                              |
      | chemoinvestigation                                                         |
      | chest wall metastasis                                                      |
      | child poverty                                                              |
      | chorioangioma                                                              |
      | choroidal vascularity index                                                |
      | chromhidrosis                                                              |
      | chronic idiopathic axonal polyneuropathy                                   |
      | classification error                                                       |
      | claw toe                                                                   |
      | climate change vulnerability                                               |
      | climate model                                                              |
      | clinical attachment level                                                  |
      | clinical monitoring                                                        |
      | cochlear synaptopathy                                                      |
      | coefficient of relatedness                                                 |
      | cognitive appraisal                                                        |
      | cognitive effort                                                           |
      | Cognitive Emotion Regulation Questionnaire                                 |
      | cognitive load                                                             |
      | cognitive psychology                                                       |
      | cognitive restructuring                                                    |
      | cognitive stress                                                           |
      | cognitive vulnerability                                                    |
      | cogwheel rigidity                                                          |
      | colonic endometriosis                                                      |
      | colorectal bleeding                                                        |
      | colorectal endometriosis                                                   |
      | colorectal obstruction                                                     |
      | Columbia suicide severity rating scale                                     |
      | commission error                                                           |
      | common technical document                                                  |
      | Common Terminology Criteria for Adverse Events                             |
      | community based surveillance                                               |
      | community resilience                                                       |
      | community resource                                                         |
      | community support                                                          |
      | comparative biology                                                        |
      | comparative biomedicine                                                    |
      | comparative medicine                                                       |
      | comparative oncology                                                       |
      | comparative pathology                                                      |
      | comparative physiology                                                     |
      | compensatory mutation                                                      |
      | complete hydatidiform mole                                                 |
      | Confusion Assessment Method                                                |
      | confusion assessment method for the intensive care unit                    |
      | congenital brain tumor                                                     |
      | congenital cardiac tumor                                                   |
      | congenital generalized fibromatosis                                        |
      | congenital hamartoma                                                       |
      | congenital hemangioma                                                      |
      | congenital infantile fibrosarcoma                                          |
      | congenital mesoblastic nephroma                                            |
      | congenital neuroblastoma                                                   |
      | congenital renal tumor                                                     |
      | congenital teratoma                                                        |
      | conspiracy theory                                                          |
      | constitutional mismatch repair deficiency syndrome                         |
      | consumption-based indicator                                                |
      | contact granuloma                                                          |
      | convergent boundary (tectonics)                                            |
      | COPD assessment test                                                       |
      | Copenhagen burnout inventory                                               |
      | coracoclavicular joint                                                     |
      | coral bleaching                                                            |
      | core gene                                                                  |
      | core genome                                                                |
      | core stability                                                             |
      | corneal collagen crosslinking                                              |
      | coronary arteritis                                                         |
      | coronavirus anxiety scale                                                  |
      | Coronavirus HKU15                                                          |
      | cortical tuber                                                             |
      | costovertebral joint                                                       |
      | COVID-19 phobia scale                                                      |
      | Coxsackievirus A10                                                         |
      | Coxsackievirus A2                                                          |
      | Coxsackievirus A21                                                         |
      | Coxsackievirus A24                                                         |
      | Coxsackievirus A4                                                          |
      | Coxsackievirus A6                                                          |
      | crude mortality rate                                                       |
      | Cryptolepis sanguinolenta                                                  |
      | crystallization-induced emission                                           |
      | cubitus valgus                                                             |
      | cubitus varus                                                              |
      | curly toe                                                                  |
      | cutaneous endometriosis                                                    |
      | cystic, mucinous, and serous neoplasms                                     |
      | cytogenetic analysis                                                       |
      | Dabie bandavirus                                                           |
      | date of birth                                                              |
      | date of death                                                              |
      | Davidson trauma scale                                                      |
      | daydreaming                                                                |
      | De Sanctis-Cacchione syndrome                                              |
      | decellularized extracellular matrix                                        |
      | deep endometriosis                                                         |
      | delayed onset muscle soreness                                              |
      | delirium assessment                                                        |
      | Deltapolyomavirus                                                          |
      | demographics                                                               |
      | dense core vesicle                                                         |
      | dental examination                                                         |
      | deoxyribonucleic acid modification                                         |
      | deprivation amblyopia                                                      |
      | depth of field                                                             |
      | depth of focus                                                             |
      | dermoid cyst                                                               |
      | Desulfobacterium                                                           |
      | Desulfococcus                                                              |
      | Desulfosarcina                                                             |
      | Desulfosporosinus                                                          |
      | diaschisis                                                                 |
      | DICER1 syndrome                                                            |
      | dielectrophoresis                                                          |
      | difficulties in emotion regulation scale                                   |
      | diffractometer                                                             |
      | diffusion kurtosis imaging                                                 |
      | digital footprint                                                          |
      | digital identity                                                           |
      | digital pathology                                                          |
      | digitization                                                               |
      | direct stochastic optical reconstruction microscopy                        |
      | disability assessment                                                      |
      | disability rights                                                          |
      | disadvantaged population                                                   |
      | discoid meniscus                                                           |
      | discretization                                                             |
      | disease mongering                                                          |
      | dispensing error                                                           |
      | diving medicine                                                            |
      | Doehlert design                                                            |
      | dosimetry error                                                            |
      | dosing error                                                               |
      | drip irrigation                                                            |
      | drug registration                                                          |
      | drug regulation                                                            |
      | dual diagnosis                                                             |
      | Duck enteritis virus                                                       |
      | ductal breast carcinoma in situ                                            |
      | dyadic coping                                                              |
      | dysovulation                                                               |
      | dysplastic nevus syndrome                                                  |
      | East Pacific Rise                                                          |
      | Echium amoenum                                                             |
      | Echium vulgare                                                             |
      | Echovirus 1                                                                |
      | Echovirus 30                                                               |
      | Echovirus 7                                                                |
      | ecological footprint                                                       |
      | economic instability                                                       |
      | economic stability                                                         |
      | economic vulnerability                                                     |
      | ecosystem service                                                          |
      | ecosystem service value                                                    |
      | ecosystem vulnerability                                                    |
      | ectopic Cushing syndrome                                                   |
      | edentulism                                                                 |
      | edentulous jaw                                                             |
      | edge to edge mitral valve repair                                           |
      | elbow stiffness                                                            |
      | elephant trunk technique                                                   |
      | elite controller                                                           |
      | embryonal and mixed neoplasms                                              |
      | embryonal tumor                                                            |
      | emergency use authorization                                                |
      | emotion regulation questionnaire                                           |
      | emotion-focused coping                                                     |
      | emotional appraisal                                                        |
      | emotional load                                                             |
      | emotional support                                                          |
      | emotional vulnerability                                                    |
      | endangiitis                                                                |
      | endobronchial metastasis                                                   |
      | endolysosome                                                               |
      | endometrial stromal nodule                                                 |
      | endophlebitis                                                              |
      | endotoxin tolerance                                                        |
      | energy footprint                                                           |
      | environmental crime                                                        |
      | environmental footprint                                                    |
      | environmental justice                                                      |
      | environmental risk                                                         |
      | environmental vulnerability                                                |
      | environmentalism                                                           |
      | environmentalist                                                           |
      | epidemic curve                                                             |
      | epidemiological model                                                      |
      | epignathus                                                                 |
      | epipelagic zone                                                            |
      | epithelioid hemangioendothelioma                                           |
      | epithelioid trophoblastic tumor                                            |
      | Eptesicus                                                                  |
      | Eptesicus fuscus                                                           |
      | Eptesicus serotinus                                                        |
      | erythema ab igne                                                           |
      | erythema gyratum repens                                                    |
      | erythroleukoplakia                                                         |
      | escapism                                                                   |
      | Escherichia coli H10407                                                    |
      | essential worker                                                           |
      | estrogen receptor-positive, HER2-negative breast cancer                    |
      | event history analysis                                                     |
      | ex utero intrapartum treatment procedure                                   |
      | exergaming                                                                 |
      | exhaled breath condensate                                                  |
      | experience seeking                                                         |
      | experiential avoidance                                                     |
      | experimental arterial thrombosis                                           |
      | experimental leptospirosis                                                 |
      | experimental lung carcinogenesis                                           |
      | experimental trypanosomiasis                                               |
      | extensor carpi radialis brevis muscle                                      |
      | extensor carpi radialis longus muscle                                      |
      | extensor carpi radialis muscle                                             |
      | extensor carpi ulnaris muscle                                              |
      | extra-adrenal pheochromocytoma                                             |
      | extrapyramidal rigidity                                                    |
      | extrauterine choriocarcinoma                                               |
      | fallopian tube endometriosis                                               |
      | familial colorectal cancer type X                                          |
      | familial cylindromatosis                                                   |
      | familial medullary thyroid carcinoma                                       |
      | familial pancreatic cancer                                                 |
      | familial prostate cancer                                                   |
      | familial renal cell carcinoma                                              |
      | family alienation                                                          |
      | family composition                                                         |
      | family structure                                                           |
      | fear of COVID-19 scale                                                     |
      | Feline herpesvirus                                                         |
      | fetal health                                                               |
      | fetal viability                                                            |
      | finger to nose test                                                        |
      | flatus incontinence                                                        |
      | fluctuating selection                                                      |
      | focal facial dermal dysplasia                                              |
      | food access                                                                |
      | foodborne botulism                                                         |
      | foot odor                                                                  |
      | forehead temperature                                                       |
      | forest floor                                                               |
      | foveal avascular zone                                                      |
      | fractional exhaled nitric oxide test                                       |
      | free flow electrophoresis                                                  |
      | frontline nurse                                                            |
      | frontline staff                                                            |
      | Froude number                                                              |
      | frozen elephant trunk technique                                            |
      | FRT cell line                                                              |
      | Fugl-Meyer assessment                                                      |
      | Fugl-Meyer Assessment for Lower Extremity                                  |
      | Fugl-Meyer Assessment for Upper Extremity                                  |
      | Fusarium virguliforme                                                      |
      | Gakkel Ridge                                                               |
      | game-based learning                                                        |
      | gamification                                                               |
      | gangliocytic paraganglioma                                                 |
      | gastric choriocarcinoma                                                    |
      | gastrointestinal symptom rating scale                                      |
      | Gelsemium sempervirens                                                     |
      | gene network analysis                                                      |
      | genetic modification                                                       |
      | genetic purging                                                            |
      | genomic medicine                                                           |
      | genomic mutation                                                           |
      | genotyping                                                                 |
      | geriatric dentistry                                                        |
      | germ cell and embryonal neoplasms                                          |
      | germ granule                                                               |
      | gestational choriocarcinoma                                                |
      | gestational trophoblastic disease                                          |
      | gestational trophoblastic neoplasia                                        |
      | giant cell aortitis                                                        |
      | giant fibroadenoma                                                         |
      | glandular and epithelial neoplasms                                         |
      | global longitudinal strain                                                 |
      | global warming potential                                                   |
      | glomangiopericytoma                                                        |
      | glomerular obsolescence                                                    |
      | glomus jugulare tumor                                                      |
      | gonopod                                                                    |
      | gonopodium                                                                 |
      | Good syndrome                                                              |
      | gossypiboma                                                                |
      | granulation tissue hyperplasia                                             |
      | Grass carp reovirus                                                        |
      | greenhouse gas emission                                                    |
      | group 1 innate lymphoid cell                                               |
      | group 2 innate lymphoid cell                                               |
      | group 3 innate lymphoid cell                                               |
      | Grouper iridovirus                                                         |
      | hadal zone                                                                 |
      | hamartomatous polyposis                                                    |
      | hammer toe syndrome                                                        |
      | hammertoe                                                                  |
      | haptic interface                                                           |
      | haptic technology                                                          |
      | Harvey Bradshaw Index                                                      |
      | health activism                                                            |
      | health risk assessment                                                     |
      | Healthy Eating Index                                                       |
      | Healthy Eating Index 2005                                                  |
      | Healthy Eating Index 2015                                                  |
      | healthy food access                                                        |
      | healthy life expectancy                                                    |
      | heart atrium aneurysm                                                      |
      | hematochezia                                                               |
      | hemocytometry                                                              |
      | hemorrhagic proctitis                                                      |
      | hemorrhagic rectocolitis                                                   |
      | Hepatitis C virus JFH-1                                                    |
      | hereditary breast cancer                                                   |
      | hereditary diffuse gastric cancer                                          |
      | hereditary gastric cancer                                                  |
      | hereditary leiomyomatosis and renal cell cancer                            |
      | hereditary ovarian cancer                                                  |
      | hereditary retinoblastoma                                                  |
      | high-grade endometrial stromal sarcoma                                     |
      | Himalaya                                                                   |
      | HIV non progressor                                                         |
      | Holistic Theory of Unpleasant Symptoms                                     |
      | home sleep apnea testing                                                   |
      | homoeologous chromosome                                                    |
      | homoeologous recombination                                                 |
      | homogenizer                                                                |
      | homologous chromosome                                                      |
      | homozygous familial hypercholesterolemia                                   |
      | hormone receptor negative breast cancer                                    |
      | hormone receptor positive breast cancer                                    |
      | hormone receptor-positive, HER2-negative breast cancer                     |
      | hormone-dependent cancer                                                   |
      | hormone-dependent neoplasm                                                 |
      | hospital to home transition                                                |
      | hospital wastewater                                                        |
      | housing instability                                                        |
      | housing quality                                                            |
      | Hoyeraal-Hreidarsson syndrome                                              |
      | Human adenovirus 3                                                         |
      | Human adenovirus 36                                                        |
      | Human astrovirus 1                                                         |
      | Human bocavirus 1                                                          |
      | Human endogenous retrovirus K                                              |
      | Human endogenous retrovirus W                                              |
      | human enterovirus                                                          |
      | Human mastadenovirus F                                                     |
      | Human papillomavirus 38                                                    |
      | Human papillomavirus type 1                                                |
      | Human papillomavirus type 13                                               |
      | Human papillomavirus type 2                                                |
      | Human papillomavirus type 3                                                |
      | human papillomavirus type 5                                                |
      | Human papillomavirus type 53                                               |
      | Human papillomavirus type 56                                               |
      | human papillomavirus type 8                                                |
      | Human polyomavirus 2                                                       |
      | Human polyomavirus 5                                                       |
      | Human polyomavirus 6                                                       |
      | Human polyomavirus 7                                                       |
      | Human polyomavirus 8                                                       |
      | hyperparathyroidism-jaw tumor syndrome                                     |
      | hypnopompic hallucination                                                  |
      | Hypoaspis                                                                  |
      | hysterical amblyopia                                                       |
      | hysterical blindness                                                       |
      | ICHD-2                                                                     |
      | ICHD-3                                                                     |
      | ictal headache                                                             |
      | illegal dumping                                                            |
      | illegal mining                                                             |
      | imaginary companion                                                        |
      | implicit bias                                                              |
      | inappropriate polypharmacy                                                 |
      | individual coping                                                          |
      | infant botulism                                                            |
      | infectious droplets and aerosols                                           |
      | infodemic                                                                  |
      | infodemiology                                                              |
      | information avoidance                                                      |
      | information overload                                                       |
      | infoveillance                                                              |
      | inherited cancer-predisposing syndrome                                     |
      | inherited digestive cancer-predisposing syndrome                           |
      | inherited nervous system cancer-predisposing syndrome                      |
      | inherited renal cancer-predisposing syndrome                               |
      | innate lymphoid cell                                                       |
      | innoculation device                                                        |
      | intermuscular fat                                                          |
      | international classification of headache disorder                          |
      | International Knee Documentation Committee scale                           |
      | international physical activity questionnaire short form                   |
      | intestinal metaplasia                                                      |
      | intestinal metaplasia of the esophagus                                     |
      | intestinal metaplasia of the stomach                                       |
      | intestinal polyposis syndrome                                              |
      | intracorporeal lithotripsy                                                 |
      | intracranial teratoma                                                      |
      | intraepithelial neoplasia                                                  |
      | intramuscular fat                                                          |
      | intravascular papillary endothelial hyperplasia                            |
      | intravoxel incoherent motion imaging                                       |
      | intromittent organ                                                         |
      | invasive breast cancer                                                     |
      | invasive ductal breast carcinoma                                           |
      | invasive ductal carcinoma                                                  |
      | invasive lobular breast carcinoma                                          |
      | invasive micropapillary carcinoma                                          |
      | invasive mole                                                              |
      | Inventory management system                                                |
      | Isatis tinctoria                                                           |
      | Jensen sarcoma                                                             |
      | Joanna Briggs Institute critical appraisal checklist                       |
      | joint of shoulder region                                                   |
      | Juan de Fuca Ridge                                                         |
      | juvenile fibroadenoma                                                      |
      | juvenile polyposis                                                         |
      | Jynx                                                                       |
      | Kansas City Cardiomyopathy Questionnaire                                   |
      | kaposiform hemangioendothelioma                                            |
      | KEGG                                                                       |
      | keratinized tissue width                                                   |
      | kinesio taping                                                             |
      | kinship coefficient                                                        |
      | knee stiffness                                                             |
      | Koeppe type goniolens                                                      |
      | Kyasanur Forest disease virus                                              |
      | laboratory based surveillance                                              |
      | lacunar infarction                                                         |
      | land footprint                                                             |
      | laparoscopic total mesorectal excision                                     |
      | late gadolinium enhancement imaging                                        |
      | lateral meniscus                                                           |
      | laterite                                                                   |
      | lead pipe rigidity                                                         |
      | least absolute shrinkage and selection operator                            |
      | least angle regression                                                     |
      | left atrial aneurysm                                                       |
      | left ventricular aneurysm                                                  |
      | left ventricular global longitudinal strain                                |
      | leiomyomatosis peritonealis disseminata                                    |
      | Leser-Trelat syndrome                                                      |
      | leukokeratosis                                                             |
      | life course perspective                                                    |
      | light-sheet microscopy                                                     |
      | limb stiffness                                                             |
      | Lindera aggregata                                                          |
      | lipofibroblast                                                             |
      | lipohyalinosis                                                             |
      | lipomatous hypertrophy of the interatrial septum                           |
      | listening effort                                                           |
      | livedoid vasculopathy                                                      |
      | liver sinusoidal endothelial cell                                          |
      | liver sinusoidal endothelium                                               |
      | liver spleen ratio                                                         |
      | lobular capillary hemangioma                                               |
      | local regression                                                           |
      | locally estimated scatterplot smoothing                                    |
      | locally weighted scatterplot smoothing                                     |
      | longitudinally extensive transverse myelitis                               |
      | low-grade endometrial stromal sarcoma                                      |
      | low-value care                                                             |
      | lower gastrointestinal bleeding                                            |
      | Lowry assay                                                                |
      | lucid dream                                                                |
      | lymphangitic carcinomatosis                                                |
      | lymphocytic thrombophilic arteritis                                        |
      | lymphoid tissue inducer cell                                               |
      | Lynch syndrome                                                             |
      | Lynch syndrome II                                                          |
      | Mach number                                                                |
      | Maffucci syndrome                                                          |
      | malignant cardiac tumor                                                    |
      | malignant mediastinal tumor                                                |
      | malignant peritoneal mesothelioma                                          |
      | mallet toe                                                                 |
      | Malnutrition Universal Screening Tool                                      |
      | Mammalian 1 orthobornavirus                                                |
      | mandibular canal                                                           |
      | marketing authorization                                                    |
      | mass gathering                                                             |
      | mass gathering medicine                                                    |
      | Masson staining                                                            |
      | mast cell activation disorder                                              |
      | maternal employment status                                                 |
      | mature teratoma                                                            |
      | maxilliped                                                                 |
      | mean absolute error                                                        |
      | mean squared error                                                         |
      | mechanical lithotripsy                                                     |
      | medial meniscus                                                            |
      | mediastinal choriocarcinoma                                                |
      | mediastinal germ cell tumor                                                |
      | mediastinal lymphoma                                                       |
      | mediastinal seminoma                                                       |
      | mediastinal teratoma                                                       |
      | medical accident                                                           |
      | medical overuse                                                            |
      | Medical Research Council Dyspnea Scale                                     |
      | medication system                                                          |
      | medullary carcinoma of the breast                                          |
      | Melaleuca alternifolia                                                     |
      | Melaleuca leucadendra                                                      |
      | melanoma-associated retinopathy                                            |
      | Memorial Delirium Assessment Scale                                         |
      | memory B lymphocyte                                                        |
      | menometrorrhagia                                                           |
      | menstrual psychosis                                                        |
      | menstrual related disorder                                                 |
      | menstrual toxic shock syndrome                                             |
      | mental effort                                                              |
      | meridional amblyopia                                                       |
      | mesenchymal hamartoma                                                      |
      | mesopelagic zone                                                           |
      | metabolic pathway analysis                                                 |
      | metabolite set enrichment analysis                                         |
      | metaplastic carcinoma of the breast                                        |
      | metastasis in breast                                                       |
      | metastatic carcinoma of the heart                                          |
      | metastatic choriocarcinoma                                                 |
      | methamphetamine-induced neurotoxicity                                      |
      | methane emission                                                           |
      | microbiology information system software                                   |
      | microneme                                                                  |
      | microsphere immunoassay                                                    |
      | microvasculitis                                                            |
      | Mid Atlantic Ridge                                                         |
      | mid ocean ridge                                                            |
      | migralepsy                                                                 |
      | mindfulness-based stress reduction                                         |
      | mini-Addenbrooke cognitive examination                                     |
      | MINOCA                                                                     |
      | mittelschmerz                                                              |
      | modified Ashworth scale                                                    |
      | Modified Medical Research Council Dyspnea Scale                            |
      | molluscivore                                                               |
      | monoclonal gammopathy of undetermined significance                         |
      | monoclonal mast cell activation syndrome                                   |
      | Monteverdia                                                                |
      | Monteverdia ilicifolia                                                     |
      | motion parallax                                                            |
      | motivational intensity                                                     |
      | mountain                                                                   |
      | mountain ranges                                                            |
      | mTORopathy                                                                 |
      | mucinous carcinoma of the breast                                           |
      | mucinous cystadenoma                                                       |
      | MuLBSTA score                                                              |
      | multi-agent system                                                         |
      | multicystic mesothelioma                                                   |
      | multinomial logistic regression                                            |
      | multiple endocrine neoplasia type 4                                        |
      | multiple familial trichoepithelioma                                        |
      | multiple polyglandular tumor                                               |
      | multiple primary neoplasm                                                  |
      | Multiple sclerosis associated retrovirus                                   |
      | multiple tumor                                                             |
      | multiplex droplet digital polymerase chain reaction                        |
      | multiplicity of infection                                                  |
      | murine adenovirus 1                                                        |
      | Murine hepatitis virus strain 3                                            |
      | Murine mastadenovirus A                                                    |
      | myasthenia gravis activities of daily living                               |
      | myofascial release                                                         |
      | Myotis daubentonii                                                         |
      | Myrmecophaga                                                               |
      | Myrmecophaga tridactyla                                                    |
      | Myxococcus xanthus DK1622                                                  |
      | nasal dermoid cyst                                                         |
      | nasopharyngeal teratoma                                                    |
      | negative binomial regression                                               |
      | negative valence                                                           |
      | neighborhood characteristic                                                |
      | neoadjuvant chemoradiotherapy                                              |
      | neoplasms by histologic type                                               |
      | neoplastic pregnancy complications                                         |
      | nephelometer                                                               |
      | nephroblastomatosis                                                        |
      | neurocutaneous melanocytosis                                               |
      | neurofibromatosis type 3                                                   |
      | neurofibromatosis-Noonan syndrome                                          |
      | neutral mutation                                                           |
      | neutralization test                                                        |
      | new drug application                                                       |
      | nine hole peg test                                                         |
      | nitrogen oxide emission                                                    |
      | Nitrosopumilus                                                             |
      | Nitrosopumilus maritimus                                                   |
      | Nitrososphaera                                                             |
      | nocturnal awakening                                                        |
      | non-gestational choriocarcinoma                                            |
      | non-radiographic axial spondyloarthritis                                   |
      | nonsense mutant                                                            |
      | nonsynonymous substitution                                                 |
      | nowcasting                                                                 |
      | nuchal rigidity                                                            |
      | nuclear speckle                                                            |
      | nucleic acid amplification techniques                                      |
      | nutritional amblyopia                                                      |
      | obscurantism                                                               |
      | ochre codon                                                                |
      | ochre mutant                                                               |
      | ochre mutation                                                             |
      | omission error                                                             |
      | oneiroid                                                                   |
      | opal codon                                                                 |
      | opal mutation                                                              |
      | open sea                                                                   |
      | operational taxonomic unit                                                 |
      | oral erythroplakia                                                         |
      | oral leukoedema                                                            |
      | oral leukoplakia                                                           |
      | oral lichen planus                                                         |
      | oral submucous fibrosis                                                    |
      | organic horizon                                                            |
      | original antigenic sin                                                     |
      | orogenesis                                                                 |
      | orogenic belt                                                              |
      | Orthobornavirus                                                            |
      | Orthohepevirus                                                             |
      | Orycteropodidae                                                            |
      | ovarian choriocarcinoma                                                    |
      | ovarian endometriosis                                                      |
      | ovarian mucinous cystadenoma                                               |
      | ovariohysterectomy                                                         |
      | overdiagnosis                                                              |
      | overlapping toe                                                            |
      | overprescribing                                                            |
      | overtreatment                                                              |
      | paddy field                                                                |
      | paddy rice                                                                 |
      | paddy soil                                                                 |
      | Paguma larvata                                                             |
      | pain severity score                                                        |
      | palmar hyperhidrosis                                                       |
      | palmoplantar hyperhidrosis                                                 |
      | pancreatic mucinous cystadenoma                                            |
      | pangenome                                                                  |
      | papillary adenoma                                                          |
      | papillary carcinoma of the breast                                          |
      | papillary cystadenoma                                                      |
      | parallax                                                                   |
      | paraneoplastic cerebellar degeneration                                     |
      | paraneoplastic dermatomyositis                                             |
      | paraneoplastic dermatosis                                                  |
      | paraneoplastic endocrine syndrome                                          |
      | paraneoplastic hypercalcemia                                               |
      | paraneoplastic hypoglycemia                                                |
      | paraneoplastic neurological syndrome                                       |
      | paraneoplastic opsoclonus myoclonus                                        |
      | paraspeckle                                                                |
      | paratonia                                                                  |
      | parental alienation                                                        |
      | parental employment status                                                 |
      | partial anterior circulation infarct                                       |
      | partial mesorectal excision                                                |
      | partial mole                                                               |
      | partially edentulous jaw                                                   |
      | particle size analyzer                                                     |
      | particulate matter 1.0                                                     |
      | paternal employment status                                                 |
      | pathway analysis                                                           |
      | patient empowerment                                                        |
      | patient safety indicator                                                   |
      | patient under investigation                                                |
      | patient under surveillance                                                 |
      | PC-9/ER cells                                                              |
      | peak global longitudinal strain                                            |
      | pectoralis minor muscle                                                    |
      | Pediatric Anesthesia Emergence Delirium                                    |
      | Pediatric Cerebral Performance Category Scale                              |
      | pediatric medulloblastoma                                                  |
      | pedipalp                                                                   |
      | pedunculated polyp                                                         |
      | penile intraepithelial neoplasia                                           |
      | perceived discrimination                                                   |
      | percutaneous dilational tracheostomy                                       |
      | pereiopod                                                                  |
      | pericardial mesothelioma                                                   |
      | pericardial teratoma                                                       |
      | periodontal ligament stem cell                                             |
      | periodontal parameters                                                     |
      | Perlman syndrome                                                           |
      | persuasive design                                                          |
      | persuasive technology                                                      |
      | pes cavovarus                                                              |
      | Phenuiviridae                                                              |
      | photoactivated localization microscopy                                     |
      | physisorption                                                              |
      | Picidae                                                                    |
      | Piciformes                                                                 |
      | pityriasis rotunda                                                         |
      | place of birth                                                             |
      | place of death                                                             |
      | placental choriocarcinoma                                                  |
      | placental site trophoblastic tumor                                         |
      | planetary health                                                           |
      | plant cone                                                                 |
      | plant senescence                                                           |
      | plantar hyperhidrosis                                                      |
      | plate boundary                                                             |
      | plate tectonics                                                            |
      | pleura malignancy                                                          |
      | pleural lymphoma                                                           |
      | pleural sarcoma                                                            |
      | pleuropulmonary blastoma                                                   |
      | podzol                                                                     |
      | Poisson regression                                                         |
      | polymalformative genetic syndrome with increased risk of developing cancer |
      | polynomial regression analysis                                             |
      | population parameters                                                      |
      | Porcine deltacoronavirus                                                   |
      | porosimetry                                                                |
      | positive valence                                                           |
      | post-ictal headache                                                        |
      | post-traumatic neoplasm                                                    |
      | posterior circulation infarction                                           |
      | posterior circulation ischemia                                             |
      | posterior circulation stroke                                               |
      | pre-ictal headache                                                         |
      | precribing guideline                                                       |
      | predatory publishing                                                       |
      | prediction error                                                           |
      | predictive model                                                           |
      | pregnancy interval                                                         |
      | premalignant hematologic disorder                                          |
      | prescribing cascade                                                        |
      | prescribing error                                                          |
      | pressurized intraperitoneal aerosol chemotherapy                           |
      | primary central nervous system vasculitis                                  |
      | primary cutaneous anaplastic large cell lymphoma                           |
      | primary hepatic lymphoma                                                   |
      | primary mediastinal large B-cell lymphoma                                  |
      | primary mediastinal lymphoma                                               |
      | primary peritoneal carcinoma                                               |
      | principal component regression                                             |
      | problem-focused coping                                                     |
      | proctalgia fugax                                                           |
      | progesterone receptor negative breast cancer                               |
      | proliferative verrucous leukoplakia                                        |
      | promyelocytic leukemia nuclear body                                        |
      | prone ventilation                                                          |
      | property crime                                                             |
      | Proteus syndrome                                                           |
      | protrusio acetabuli                                                        |
      | psychiatric dual diagnosis                                                 |
      | psychogenic visual disturbance                                             |
      | psychological care                                                         |
      | psychological first aid                                                    |
      | psychological well-being scale                                             |
      | psychosomatic symptom                                                      |
      | PTEN hamartoma tumor syndrome                                              |
      | Pueraria montana                                                           |
      | pulmonary artery systolic pressure                                         |
      | pulmonary choriocarcinoma                                                  |
      | pulmonary embolectomy                                                      |
      | pulmonary endarterectomy                                                   |
      | pyemia                                                                     |
      | Pyrrosia                                                                   |
      | quadratus lumborum block                                                   |
      | quantile regression                                                        |
      | quantization                                                               |
      | quick COVID-19 severity index                                              |
      | quick inventory of depressive symptomatology                               |
      | radial peripapillary capillary                                             |
      | radiation induced cancer                                                   |
      | radiation proctitis                                                        |
      | radiation-induced leukemia                                                 |
      | radiotherapy error                                                         |
      | radiotherapy positioning error                                             |
      | Ramphastidae                                                               |
      | rapid assessment of physical activity                                      |
      | rapid on-site evaluation                                                   |
      | rapidly involuting congenital hemangioma                                   |
      | rectal endometriosis                                                       |
      | rectal tenesmus                                                            |
      | rectovaginal endometriosis                                                 |
      | rectum obstruction                                                         |
      | reflected appraisal                                                        |
      | refractive amblyopia                                                       |
      | refractory cytopenia of childhood                                          |
      | refractory cytopenia with unilineage dysplasia                             |
      | regolith                                                                   |
      | regression discontinuity design                                            |
      | regression model                                                           |
      | residence characteristics                                                  |
      | respiratory droplets and aerosols                                          |
      | resuscitative endovascular balloon occlusion of the aorta                  |
      | retained fetal membrane                                                    |
      | retained products of conception                                            |
      | retained surgical item                                                     |
      | reticuloendothelial tumor                                                  |
      | retinal capillary hemangioma                                               |
      | retroperitoneal leiomyosarcoma                                             |
      | retroperitoneal metastasis                                                 |
      | retroperitoneal mucinous cystadenoma                                       |
      | reversal of apoptosis                                                      |
      | Reynoutria                                                                 |
      | rheumatic carditis                                                         |
      | rheumatic endocarditis                                                     |
      | rheumatic myocarditis                                                      |
      | rheumatic pericarditis                                                     |
      | rhomboid major                                                             |
      | rhomboid minor                                                             |
      | rhomboid muscle                                                            |
      | ribonucleoprotein granule                                                  |
      | ridge regression                                                           |
      | rift zone                                                                  |
      | right atrial aneurysm                                                      |
      | right ventricular aneurysm                                                 |
      | risk model                                                                 |
      | Rocky Mountains                                                            |
      | root mean squared error                                                    |
      | Saccharolobus                                                              |
      | Saccharolobus shibatae                                                     |
      | Saccharolobus solfataricus                                                 |
      | saline soil                                                                |
      | salinization                                                               |
      | salivary gland type breast cancer                                          |
      | Salmonella enterica subsp. enterica                                        |
      | sarcoma 37                                                                 |
      | SARS-CoV-2 (clinical isolate 01/human/Jan2020/Thailand)                    |
      | SARS-CoV-2 (clinical isolate BetaCoV/Hong Kong/VM20001061/2020)            |
      | SARS-CoV-2 (clinical isolate BetaCoV/South Korea/KUMC01/2020)              |
      | SARS-CoV-2 (clinical isolate Denmark/DK-AHH1/2020)                         |
      | SARS-CoV-2 (clinical isolate Munich 929)                                   |
      | SARS-CoV-2 (clinical isolate SARS-CoV-2/human/RUS/Dubrovka/2020)           |
      | SARS-CoV-2 (clinical isolate UC-1074)                                      |
      | SARS-CoV-2 (clinical isolate UC-1075)                                      |
      | SARS-CoV-2 (clinical isolate USA/NYU-VC-003/2020)                          |
      | SARS-CoV-2 (clinical isolate USA/UF-1/2020)                                |
      | SARS-CoV-2 (isolate hCoV-19/USA/CA-CDC-5574/2020 (B.1.1.7))                |
      | SARS-CoV-2 (strain BetaCoV/France/IDF/200107/2020)                         |
      | SARS-CoV-2 (strain BetaCoV/Shenzhen/SZTH-003/2020)                         |
      | SARS-CoV-2 (strain England/2/2020)                                         |
      | SARS-CoV-2 (strain IHUMI-6)                                                |
      | SARS-CoV-2 (strain MA10)                                                   |
      | SARS-CoV-2 Delta                                                           |
      | SARS-CoV-2 Lambda variant                                                  |
      | SARS-CoV-2 lineage B.1.1.529                                               |
      | SARS-CoV-2 lineage B.1.1.70                                                |
      | SARS-CoV-2 lineage B.1.617                                                 |
      | SARS-CoV-2 Mu variant                                                      |
      | SARS-CoV-2 VUI-21APR-01                                                    |
      | satsuma (orange)                                                           |
      | Scale for the Assessment of Negative Symptoms                              |
      | Scale for the Assessment of Positive Symptoms                              |
      | scapulothoracic joint                                                      |
      | scar endometriosis                                                         |
      | Schinzel-Giedion syndrome                                                  |
      | schistocyte                                                                |
      | school closure                                                             |
      | school reopening                                                           |
      | Schussler salts                                                            |
      | seamount                                                                   |
      | second primary neoplasm                                                    |
      | secretome                                                                  |
      | secretory breast carcinoma                                                 |
      | security personnel                                                         |
      | seismicity                                                                 |
      | self advocacy                                                              |
      | self alienation                                                            |
      | self compassion                                                            |
      | senescence-associated secretory phenotype                                  |
      | sentiment analysis                                                         |
      | septum aneurysm                                                            |
      | serous cystadenoma                                                         |
      | serratus anterior muscle                                                   |
      | sessile polyp                                                              |
      | Severe fever with thrombocytopenia syndrome virus                          |
      | short physical performance battery                                         |
      | shoulder girdle muscle                                                     |
      | shoulder joint                                                             |
      | signaling pathway analysis                                                 |
      | Simian varicella virus                                                     |
      | Simian-Human immunodeficiency virus                                        |
      | Singapore grouper iridovirus                                               |
      | Single Assessment Numeric Evaluation                                       |
      | single-molecule localization microscopy                                    |
      | sister chromatid cohesion                                                  |
      | sit-to-stand test                                                          |
      | sleep talking                                                              |
      | sleep terror                                                               |
      | sluggish cognitive tempo                                                   |
      | social avoidance                                                           |
      | social mobilization                                                        |
      | social movement                                                            |
      | social parameters                                                          |
      | Social Responsiveness Scale                                                |
      | Social Responsiveness Scale-second edition                                 |
      | social vulnerability                                                       |
      | societal cost                                                              |
      | sociodemographics                                                          |
      | socioeconomic parameters                                                   |
      | socioeconomic vulnerability                                                |
      | soft stool                                                                 |
      | software agent                                                             |
      | soil decontamination                                                       |
      | soil disinfestation                                                        |
      | soil health                                                                |
      | soil layer                                                                 |
      | soil parent material                                                       |
      | soil remediation                                                           |
      | soil salinity                                                              |
      | soil salinization                                                          |
      | Southwest Indian Ridge                                                     |
      | soybean sudden death syndrome                                              |
      | spinal cord hemangioblastoma                                               |
      | spinal stiffness                                                           |
      | spindle cell hemangioma                                                    |
      | splenic lymphoma                                                           |
      | sporadic disease                                                           |
      | sporadic pheochromocytoma                                                  |
      | sprinkler irrigation                                                       |
      | statistical design                                                         |
      | statistical error                                                          |
      | status migrainosus                                                         |
      | sterilizing immunity                                                       |
      | stimulated emission depletion microscopy                                   |
      | stochastic optical reconstruction microscopy                               |
      | Stop-Bang Questionnaire                                                    |
      | strabismic amblyopia                                                       |
      | stress granule                                                             |
      | stromal vascular fraction                                                  |
      | structural racism                                                          |
      | struma ovarii                                                              |
      | subduction                                                                 |
      | subduction zone                                                            |
      | subendocardium                                                             |
      | subgenual anterior cingulate cortex                                        |
      | subgenual cingulate cortex                                                 |
      | subsoil                                                                    |
      | substitution mutation                                                      |
      | sudden arrhythmic death syndrome                                           |
      | sudden unexpected death in epilepsy                                        |
      | sudden unexplained death in childhood                                      |
      | Sulfuricurvum                                                              |
      | Sulfurimonas                                                               |
      | Sulfurisphaera                                                             |
      | Sulfurisphaera tokodaii                                                    |
      | Sulfurovaceae                                                              |
      | Sulfurovum                                                                 |
      | superficial endometriosis                                                  |
      | support-seeking                                                            |
      | suppressor mutation                                                        |
      | surface analysis                                                           |
      | surgical embolectomy                                                       |
      | surrogate virus neutralization test                                        |
      | susceptible exposed infectious recovered model                             |
      | susceptible infected recovered model                                       |
      | susceptible infected susceptible model                                     |
      | sustainable development goal                                               |
      | swept source optical coherence tomography angiography                      |
      | Swiss cheese model                                                         |
      | synaptic disorder                                                          |
      | synaptic dysfunction                                                       |
      | synonymous substitution                                                    |
      | systems genetics                                                           |
      | systems medicine                                                           |
      | systems pharmacology                                                       |
      | systems research                                                           |
      | systems science                                                            |
      | Syzygium polyanthum                                                        |
      | T1 weighted imaging                                                        |
      | T2 weighted imaging                                                        |
      | tail fan                                                                   |
      | Talitridae                                                                 |
      | Tamandua                                                                   |
      | Tamandua tetradactyla                                                      |
      | TCID50                                                                     |
      | tectonic plate                                                             |
      | telecare                                                                   |
      | telson                                                                     |
      | testicular choriocarcinoma                                                 |
      | texture analysis                                                           |
      | theriogenology                                                             |
      | thin basement membrane nephropathy                                         |
      | thioacetamide-induced hepatotoxicity                                       |
      | Thiovulaceae                                                               |
      | thoracic cancer                                                            |
      | thoracic endometriosis                                                     |
      | thoracic metastasis                                                        |
      | thoracic tumor                                                             |
      | thrill seeking                                                             |
      | thrombangiitis                                                             |
      | thromboarteritis                                                           |
      | thymic epithelial neoplasm                                                 |
      | thymic neoplasm                                                            |
      | thymic neuroendocrine carcinoma                                            |
      | thymic neuroendocrine tumor                                                |
      | thymic squamous cell carcinoma                                             |
      | thymolipoma                                                                |
      | thymoma type A                                                             |
      | thymoma type AB                                                            |
      | thymoma type B                                                             |
      | thymoma type B1                                                            |
      | thymoma type B2                                                            |
      | thymoma type B3                                                            |
      | thymus carcinoma                                                           |
      | tissue culture infectious dose                                             |
      | tobacco amblyopia                                                          |
      | total anterior circulation infarct                                         |
      | toxic amblyopia                                                            |
      | toxidrome                                                                  |
      | transcatheter edge to edge mitral valve repair                             |
      | transient monocular blindness                                              |
      | translational bioinformatics                                               |
      | translational biology                                                      |
      | translational medicine                                                     |
      | translational science                                                      |
      | transmission electron microscope                                           |
      | Trichodysplasia spinulosa-associated polyomavirus                          |
      | trichoscopy                                                                |
      | tripe palms                                                                |
      | triple-positive breast cancer                                              |
      | trogocytosis                                                               |
      | tropical dry forest                                                        |
      | tropical forest                                                            |
      | Tropilaelaps                                                               |
      | tubular carcinoma of the breast                                            |
      | tufted angioma                                                             |
      | tumor mutational burden                                                    |
      | type I error                                                               |
      | type II error                                                              |
      | typographical error                                                        |
      | underdiagnosis                                                             |
      | underprescribing                                                           |
      | understory                                                                 |
      | undifferentiated uterine sarcoma                                           |
      | unidentified deceased                                                      |
      | university staff                                                           |
      | unnecessary prescribing                                                    |
      | unnecessary surgery                                                        |
      | unnecessary therapy                                                        |
      | ureteral bypass device                                                     |
      | urinary tract endometriosis                                                |
      | urinary tuberculosis                                                       |
      | uropod                                                                     |
      | uterine choriocarcinoma                                                    |
      | vaccine development                                                        |
      | vaccine-associated disease enhancement                                     |
      | Vaccinia virus Ankara                                                      |
      | vaginal endometriosis                                                      |
      | vaginal temperature                                                        |
      | valence (chemistry)                                                        |
      | valence (emotion)                                                          |
      | vandalism                                                                  |
      | vascular depression                                                        |
      | vein endothelium                                                           |
      | ventricular septal aneurysm                                                |
      | venule density                                                             |
      | Vermilingua                                                                |
      | vermivore                                                                  |
      | Vero E6-high ACE2 cell line                                                |
      | vesical tenesmus                                                           |
      | video assisted anal fistula treatment                                      |
      | video assisted mediastinoscopic lymphadenectomy                            |
      | video assisted mediastinoscopy                                             |
      | video assisted retroperitoneal debridement                                 |
      | video assisted surgery                                                     |
      | video assisted technique                                                   |
      | video assisted thoracoscopic lobectomy                                     |
      | video capsule endoscopy                                                    |
      | video interview                                                            |
      | videocapillaroscopy                                                        |
      | videolaparoscopy                                                           |
      | Vineland Adaptive Behavior Scale                                           |
      | Vineland Adaptive Behavior Scale-second edition                            |
      | viropexis                                                                  |
      | virtual assistant                                                          |
      | virus cell membrane fusion                                                 |
      | virus endocytosis                                                          |
      | virus neutralization test                                                  |
      | vocal process granuloma                                                    |
      | vulnerability                                                              |
      | vulvar lichen planus                                                       |
      | water footprint                                                            |
      | watery stool                                                               |
      | weighted gene co expression network analysis                               |
      | window of vulnerability                                                    |
      | World Health Organization Disability Assessment Schedule                   |
      | World Health Organization Disability Assessment Schedule 2.0               |
      | wound botulism                                                             |
      | wrong site surgery                                                         |
      | X-linked dyskeratosis congenita                                            |
      | X-ray diffractometer                                                       |
      | xeroderma pigmentosum group E                                              |
      | xeroderma pigmentosum variant                                              |
      | years of potential life lost                                               |
      | zooxanthellae                                                              |

  @C506474
  Scenario Outline: Verify that changed Emtree terms from 2022.01 are present in BE
    Given I set the endpoint for the http request to /rest/searchquery/term/autocomplete
    And I set the queryParam term with value <term>
    And I set the queryParam limit with value 10
    And I set a valid SESSION cookie
    When I execute the http request with method GET
    Then the status code of the response is 200
    And the first suggested term is <term>
    Examples:
      | term                                                  |
      | aardvark (genus)                                      |
      | angioimmunoblastic T cell lymphoma                    |
      | attention deficit hyperactivity disorder              |
      | atypical hemolytic uraemic syndrome                   |
      | Cognitive Emotion Regulation Questionnaire            |
      | ductal breast carcinoma in situ                       |
      | edentulism                                            |
      | emotion regulation questionnaire                      |
      | fibroadenoma                                          |
      | genetic modification                                  |
      | genotyping                                            |
      | gestational trophoblastic disease                     |
      | hammertoe                                             |
      | intestinal metaplasia                                 |
      | invasive mole                                         |
      | left ventricular aneurysm                             |
      | malignant cardiac tumor                               |
      | malignant mediastinal tumor                           |
      | metastatic carcinoma of the heart                     |
      | mucinous cystadenoma                                  |
      | nucleic acid amplification techniques                 |
      | open sea                                              |
      | Orthobornavirus                                       |
      | paraneoplastic endocrine syndrome                     |
      | PC-9/ER cells                                         |
      | place of birth                                        |
      | pleura malignancy                                     |
      | prescribing error                                     |
      | retained surgical item                                |
      | reticuloendothelial tumor                             |
      | Saccharolobus shibatae                                |
      | Saccharolobus solfataricus                            |
      | SARS-CoV-2 VUI-21APR-01                               |
      | satsuma (orange)                                      |
      | social avoidance                                      |
      | Sulfurisphaera tokodaii                               |
      | thoracic cancer                                       |
      | thoracic cancer                                       |
      | thoracic metastasis                                   |
      | thoracic tumor                                        |
      | thoracic tumor                                        |
      | two dimensional gel electrophoresis                   |
      | understory                                            |
      | aguracingene cadoparvovec                             |
      | angiotropin                                           |
      | anselamimab                                           |
      | bavunalimab                                           |
      | botaretigene sparoparvovec                            |
      | ciltacabtagene autoleucel                             |
      | dinutuximab                                           |
      | domofenogene zalfaparvovec                            |
      | doxecitine                                            |
      | dust mite extract                                     |
      | efprezimod alfa                                       |
      | endoplasmic reticulum chaperone BiP                   |
      | etuvetidigene autotemcel                              |
      | fazirsiran                                            |
      | firolimogene autotemcel                               |
      | fostroxacitabine bralpamide                           |
      | grapiprant                                            |
      | homatropine methylbromide plus hydrocodone bitartrate |
      | homeobox protein Nkx-2.2                              |
      | Human papilloma virus vaccine                         |
      | hydroxyethyl starch                                   |
      | idrevloride                                           |
      | ifezuntirgene inilparvovec                            |
      | iopofosine i 131                                      |
      | ivabradine                                            |
      | laruparetigene zovaparvovec                           |
      | mupirocin                                             |
      | neuronal migration protein doublecortin               |
      | olitigaltin                                           |
      | onternabez                                            |
      | pegipanermin                                          |
      | pivekimab sunirine                                    |
      | pruxelutamide                                         |
      | rebemadlin                                            |
      | sirolimus                                             |
      | testosterone buciclate                                |
      | tosatoxumab                                           |
      | tozinameran                                           |
      | ulenistamab                                           |
      | virus entry inhibitor                                 |
      | zegocractin                                           |
      | zenuzolac                                             |
      | zinpentraxin alfa                                     |

