@api @BE @skip @emtree_2022
Feature: Emtree-2022.02

  Background:
    Given I set the endpoint for the http request to /mock/login
    And I set the request header Content-Type with value application/json
    And I set the request body with content from file \jsonFiles\mock-sguserdetails.json
    And I execute the http request with method POST
    And I capture cookies from the authentication method

  @C544604
  Scenario Outline: Verify that newly added Emtree terms from 2022.02 are present BE
    Given I set the endpoint for the http request to /rest/searchquery/term/autocomplete
    And I set the queryParam term with value <term>
    And I set the queryParam limit with value 10
    And I set a valid SESSION cookie
    When I execute the http request with method GET
    And the status code of the response is 200
    And the first suggested term is <term>
    Examples:
      | term                                                                             |
      | 3,5 diiodothyropropionic acid                                                    |
      | abbv 011                                                                         |
      | abdala (vaccine)                                                                 |
      | abimtrelvir                                                                      |
      | acrixolimab                                                                      |
      | ak-otof                                                                          |
      | amibufenamide                                                                    |
      | amredobresib                                                                     |
      | anditixafortide yttrium y 90                                                     |
      | anivovetmab                                                                      |
      | aro apoc3                                                                        |
      | atinvicitinib                                                                    |
      | aurora-cov                                                                       |
      | avutometinib                                                                     |
      | azilsartan mepixetil                                                             |
      | azilsartan mopivabil                                                             |
      | bafrekalant                                                                      |
      | balcinrenone                                                                     |
      | bbp 671                                                                          |
      | benzgalantamine                                                                  |
      | bersiporocin                                                                     |
      | besilesomab tc 99m                                                               |
      | besilesomab y 90                                                                 |
      | betifisolimab                                                                    |
      | bexirestrant                                                                     |
      | bexotegrast                                                                      |
      | bezuclastinib                                                                    |
      | bliretrigine                                                                     |
      | bnz 1                                                                            |
      | bocidelpar                                                                       |
      | boserolimab                                                                      |
      | briquilimab                                                                      |
      | burfiralimab                                                                     |
      | cabamiquine                                                                      |
      | caffeine plus paracetamol                                                        |
      | camoteskimab                                                                     |
      | celecoxib plus tramadol                                                          |
      | cemdomespib                                                                      |
      | Centella asiatica extract plus Plectranthus amboinicus extract                   |
      | cifurtilimab                                                                     |
      | cipepofol                                                                        |
      | cirevetmab                                                                       |
      | claficapavir                                                                     |
      | clostridioides difficile clostridium perfringens vaccine                         |
      | cobnabexagene anvuparvovec                                                       |
      | corbevax                                                                         |
      | covax-19 vaccine                                                                 |
      | covifenz                                                                         |
      | covilo                                                                           |
      | coviran barekat                                                                  |
      | crexavibart                                                                      |
      | cudetaxestat                                                                     |
      | dalucabtagene autoleucel                                                         |
      | debotansine                                                                      |
      | deucrictibant                                                                    |
      | deutenzalutamide                                                                 |
      | dexfadrostat                                                                     |
      | eciruciclib                                                                      |
      | ecnoglutide                                                                      |
      | efocipegtrutide                                                                  |
      | efrilacedase alfa                                                                |
      | elapomestrocel                                                                   |
      | elarekibep                                                                       |
      | elcubragistat                                                                    |
      | elzovantinib                                                                     |
      | emfizatamab                                                                      |
      | emilimogene sigulactibac                                                         |
      | emirodatamab                                                                     |
      | emrusolmin                                                                       |
      | enbezotinib                                                                      |
      | encukalner                                                                       |
      | engabexagene cincesparvovec                                                      |
      | enitociclib                                                                      |
      | ensitrelvir                                                                      |
      | envonalkib                                                                       |
      | evencaleucel                                                                     |
      | fakhravac                                                                        |
      | fasedienol                                                                       |
      | fazpilodemab                                                                     |
      | feniralstat                                                                      |
      | fidrisertib                                                                      |
      | finasteride plus tadalafil                                                       |
      | fipaxalparant                                                                    |
      | fipravirimat                                                                     |
      | fiztasovimab                                                                     |
      | frexalimab                                                                       |
      | gallium boclatixafortide ga 68                                                   |
      | garsorasib                                                                       |
      | gebasaxturev                                                                     |
      | gersizangitide                                                                   |
      | gilmelisib                                                                       |
      | glr2007                                                                          |
      | glurate                                                                          |
      | golocdacimab                                                                     |
      | gx-19 vaccine                                                                    |
      | hemoglobin sucistil                                                              |
      | icomidocholic acid                                                               |
      | ifinatamab                                                                       |
      | ifinatamab deruxtecan                                                            |
      | imvotamab                                                                        |
      | inezetamab                                                                       |
      | iruplinalkib                                                                     |
      | ispectamab                                                                       |
      | ispectamab debotansine                                                           |
      | itruvone                                                                         |
      | ixoberogene soroparvovec                                                         |
      | izalontamab                                                                      |
      | izenivetmab                                                                      |
      | izilendustat                                                                     |
      | izorlisib                                                                        |
      | jr 171                                                                           |
      | kb407                                                                            |
      | kconvac                                                                          |
      | kovivac                                                                          |
      | lafadofensine                                                                    |
      | latikafusp                                                                       |
      | lecilimogene autotemcel                                                          |
      | lesabelimab                                                                      |
      | linaprazan glurate                                                               |
      | lintuzumab ac 225                                                                |
      | linvencorvir                                                                     |
      | litifilimab                                                                      |
      | lixmabegagene relduparvovec                                                      |
      | luveltamab                                                                       |
      | luveltamab tazevibulin                                                           |
      | luveltamab tazide                                                                |
      | masavibart                                                                       |
      | masavibart plus nepuvibart                                                       |
      | medetomidine plus vatinoxan                                                      |
      | mepixetil                                                                        |
      | methacetin c 13                                                                  |
      | minzasolmin                                                                      |
      | mitiperstat                                                                      |
      | mopivabil                                                                        |
      | motugivatrep                                                                     |
      | mufemilast                                                                       |
      | mulnitorsen                                                                      |
      | mvc-cov1901 vaccine                                                              |
      | nanrilkefusp alfa                                                                |
      | narazaciclib                                                                     |
      | navepegritide                                                                    |
      | nepuvibart                                                                       |
      | nesuparib                                                                        |
      | nirmatrelvir                                                                     |
      | nirmatrelvir plus ritonavir                                                      |
      | nomlabofusp                                                                      |
      | ntla 2001                                                                        |
      | nulabeglogene autogedtemcel                                                      |
      | obaluronate                                                                      |
      | obisbemeda                                                                       |
      | obisbemeda rhenium re 186                                                        |
      | ogalvibart                                                                       |
      | omburtamab barzuxetan lutetium lu 177                                            |
      | onfasprodil                                                                      |
      | onradivir                                                                        |
      | onterodrimer                                                                     |
      | opilrelagene atradenorepvec                                                      |
      | osemitamab                                                                       |
      | paclitaxel obaluronate                                                           |
      | padnarsertib                                                                     |
      | palsucibep pegol                                                                 |
      | paltimatrectinib                                                                 |
      | palupiprant                                                                      |
      | paridiprubart                                                                    |
      | pbft02                                                                           |
      | pbkr03                                                                           |
      | peceleganan                                                                      |
      | pegenzileukin                                                                    |
      | pemvidutide                                                                      |
      | peresolimab                                                                      |
      | pertuzumab zuvotolimod                                                           |
      | pesampator                                                                       |
      | pezadeftide                                                                      |
      | pirmitegravir                                                                    |
      | Plectranthus amboinicus extract                                                  |
      | plixacabtagene autoleucel                                                        |
      | polvitolimod                                                                     |
      | posdinemab                                                                       |
      | posovolone                                                                       |
      | povorcitinib                                                                     |
      | ptr 01                                                                           |
      | qazcovid-in                                                                      |
      | quabodepistat                                                                    |
      | rafutrombopag                                                                    |
      | raguneprocel                                                                     |
      | rapcabtagene autoleucel                                                          |
      | razi cov pars                                                                    |
      | remumiocel                                                                       |
      | reozalimab                                                                       |
      | repagermanium                                                                    |
      | retezorogant                                                                     |
      | revumenib                                                                        |
      | riltozinameran                                                                   |
      | rilunermin alfa                                                                  |
      | riminkefon                                                                       |
      | rimtoregtide                                                                     |
      | ruzotolimod                                                                      |
      | safimaltib                                                                       |
      | safusidenib                                                                      |
      | selcopintide                                                                     |
      | semzuvolimab                                                                     |
      | sig 005                                                                          |
      | sirpefenicol                                                                     |
      | soberana 02                                                                      |
      | soberana plus                                                                    |
      | sovleplenib                                                                      |
      | sozinibercept                                                                    |
      | sucistil                                                                         |
      | sudocetaxel                                                                      |
      | sudocetaxel zendusortide                                                         |
      | tak 611                                                                          |
      | tanuxiciclib                                                                     |
      | tazevibulin                                                                      |
      | tazide                                                                           |
      | tedromer                                                                         |
      | tegileridine                                                                     |
      | tinengotinib                                                                     |
      | tovorafenib                                                                      |
      | trastuzumab corixetan                                                            |
      | trisdecanoin                                                                     |
      | trontinemab                                                                      |
      | tsha 105                                                                         |
      | tulmimetostat                                                                    |
      | turkovac                                                                         |
      | ulixacaltamide                                                                   |
      | utatrectinib                                                                     |
      | utreglutide                                                                      |
      | ux053                                                                            |
      | vanzacaftor                                                                      |
      | var002                                                                           |
      | vicasinabin                                                                      |
      | visugromab                                                                       |
      | vixicovtogene oboplasmid                                                         |
      | vla2001 vaccine                                                                  |
      | vobramitamab                                                                     |
      | vobramitamab duocarmazine                                                        |
      | volamcabtagene durzigedleucel                                                    |
      | voxvoganan                                                                       |
      | vurolenatide                                                                     |
      | vutiglabridin                                                                    |
      | xalnesiran                                                                       |
      | zaftuclenegene piruparvovec                                                      |
      | zagociguat                                                                       |
      | zamaglutenase                                                                    |
      | zelpultide alfa                                                                  |
      | zendusortide                                                                     |
      | zevaquenabant                                                                    |
      | zilurgisertib                                                                    |
      | zinlirvimab                                                                      |
      | zipalertinib                                                                     |
      | zolunicant                                                                       |
      | zuvotolimod                                                                      |
      | zycov-d                                                                          |
      | ab interno trabeculectomy                                                        |
      | abdominal myomectomy                                                             |
      | abdominal radical trachelectomy                                                  |
      | abductor digiti minimi muscle (foot)                                             |
      | abductor digiti minimi muscle (hand)                                             |
      | abductor hallucis muscle                                                         |
      | abductor pollicis brevis muscle                                                  |
      | abductor pollicis longus muscle                                                  |
      | abrasion resistance                                                              |
      | absence seizure                                                                  |
      | absorbent dressing                                                               |
      | abuse of power                                                                   |
      | Acanthamoeba cultbersoni                                                         |
      | Acinetobacter indicus                                                            |
      | acne excoriee                                                                    |
      | acne keloidalis                                                                  |
      | acquired bilateral nevus of Ota-like macules                                     |
      | acquired melanocytic nevus                                                       |
      | acral lentiginous melanoma                                                       |
      | acroangiodermatitis                                                              |
      | active hyperemia                                                                 |
      | active listening                                                                 |
      | acute urticaria                                                                  |
      | adductor hallucis muscle                                                         |
      | adductor pollicis muscle                                                         |
      | adenoma of the nasal cavity                                                      |
      | adenomectomy                                                                     |
      | adrenal surgery                                                                  |
      | Adult ADHD Self-Report Scale                                                     |
      | adult T cell leukemia                                                            |
      | adverse food reaction                                                            |
      | aggressive digital papillary adenocarcinoma                                      |
      | aggressive primary cutaneous T-cell lymphoma                                     |
      | Albizia julibrissin                                                              |
      | allergic bronchopulmonary mycosis                                                |
      | allergic contact cheilitis                                                       |
      | allergic contact dermatitis                                                      |
      | allergic inflammation                                                            |
      | Alloprevotella                                                                   |
      | almond allergy                                                                   |
      | aluminium allergy                                                                |
      | aluminosis                                                                       |
      | ampullectomy                                                                     |
      | anaphylactoid reaction                                                           |
      | anconeus muscle                                                                  |
      | angioblastic meningioma                                                          |
      | angioleiomyoma                                                                   |
      | angiomatous meningioma                                                           |
      | angular artery                                                                   |
      | angular cheilitis                                                                |
      | Ankylosing Spondylitis Quality of Life questionnaire                             |
      | anterior cervical discectomy                                                     |
      | anterior choroidal artery                                                        |
      | anterior humeral circumflex artery                                               |
      | anterior interosseous artery                                                     |
      | anterior knee pain scale                                                         |
      | anterior scalene muscle                                                          |
      | anterior spinal artery                                                           |
      | anterior tibial artery                                                           |
      | anterolateral thoracotomy                                                        |
      | antimony poisoning                                                               |
      | Aphanomyces astaci                                                               |
      | Aphanomyces invadans                                                             |
      | apocrine carcinoma of the breast                                                 |
      | apocrine hidrocystoma                                                            |
      | apocrine sweat gland carcinoma                                                   |
      | apple allergy                                                                    |
      | aquagenic keratoderma                                                            |
      | aquagenic pruritus                                                               |
      | artery of Adamkiewicz                                                            |
      | arthroscopic partial meniscectomy                                                |
      | arytenoid muscle                                                                 |
      | ascending pharyngeal artery                                                      |
      | atopic march                                                                     |
      | atypical blue nevus                                                              |
      | atypical Spitz nevus                                                             |
      | auditory artery                                                                  |
      | autoimmune urticaria                                                             |
      | axillary thoracotomy                                                             |
      | baboon syndrome                                                                  |
      | Bacteroides xylanisolvens                                                        |
      | bagassosis                                                                       |
      | banding ligation                                                                 |
      | barodontalgia                                                                    |
      | basal and squamous cell carcinoma                                                |
      | basaloid follicular hamartoma                                                    |
      | base rate neglect                                                                |
      | benign bronchial tumor                                                           |
      | benign fibrous histiocytoma                                                      |
      | benign hair follicle tumor                                                       |
      | benign laryngeal tumor                                                           |
      | benign lung tumor                                                                |
      | benign melanocytic tumor                                                         |
      | benign mesothelioma                                                              |
      | benign nasal tumor                                                               |
      | benign pleural tumor                                                             |
      | benign sweat gland tumor                                                         |
      | benign vascular tumor                                                            |
      | Bifidobacterium lactis                                                           |
      | bilateral adrenalectomy                                                          |
      | bilateral laparoscopic adrenalectomy                                             |
      | bilateral sagittal split osteotomy                                               |
      | biphasic anaphylaxis                                                             |
      | birdsong                                                                         |
      | blue nevi and related lesions                                                    |
      | borderline melanocytic tumor                                                     |
      | Boston Carpal Tunnel Questionnaire                                               |
      | Bovine torovirus                                                                 |
      | brachialis muscle                                                                |
      | brain melanoma                                                                   |
      | breast computed tomography                                                       |
      | breast magnetic resonance imaging                                                |
      | breast-Q                                                                         |
      | breath hold diving                                                               |
      | breath holding spell                                                             |
      | bribery                                                                          |
      | bronchial adenoma                                                                |
      | bronchial hamartoma                                                              |
      | bronchial lipoma                                                                 |
      | bronchopulmonary sarcoma                                                         |
      | buccinator muscle                                                                |
      | bullectomy                                                                       |
      | burning micturition                                                              |
      | Camellia sinensis var. assamica                                                  |
      | Camellia sinensis var. sinensis                                                  |
      | canal wall down mastoidectomy                                                    |
      | canal wall up mastoidectomy                                                      |
      | cancel culture                                                                   |
      | candidal intertrigo                                                              |
      | cantholysis                                                                      |
      | canthotomy                                                                       |
      | carbon tetrachloride-induced acute liver injury                                  |
      | carbon tetrachloride-induced chronic liver injury                                |
      | carcinoma of the nail                                                            |
      | carpal tunnel release                                                            |
      | cashew allergy                                                                   |
      | catheter malfunction                                                             |
      | cavernous lymphangioma                                                           |
      | cavernous sinus metastasis                                                       |
      | cecum resection                                                                  |
      | cellular blue nevus                                                              |
      | central nervous system cavernous hemangioma                                      |
      | central nervous system melanoma                                                  |
      | cerebral angiomatosis                                                            |
      | cerebral cavernous malformation                                                  |
      | Chalder Fatigue Scale                                                            |
      | cholestatic pruritus                                                             |
      | choroidal hemangioma                                                             |
      | chronic hypersensitivity pneumonitis                                             |
      | chronic inducible urticaria                                                      |
      | chronic pain acceptance questionnaire                                            |
      | chronic spontaneous urticaria                                                    |
      | Chronic Venous Insufficiency Quality of Life Questionnaire                       |
      | CIED infection                                                                   |
      | ciliary body melanoma                                                            |
      | circulating recombinant form                                                     |
      | circumscribed choroidal hemangioma                                               |
      | clear cell acanthoma                                                             |
      | clear cell hidradenoma                                                           |
      | clear cell meningioma                                                            |
      | clinical dementia rating scale                                                   |
      | Clinical Opioid Withdrawal Scale                                                 |
      | cobalt allergy                                                                   |
      | cobalt intoxication                                                              |
      | cold hypersensitivity                                                            |
      | cold snare polypectomy                                                           |
      | colectomy                                                                        |
      | collagen vascular disease                                                        |
      | colorectal adenocarcinoma                                                        |
      | colorectal sarcoma                                                               |
      | colorectal squamous cell carcinoma                                               |
      | colorism                                                                         |
      | colpectomy                                                                       |
      | colpocleisis                                                                     |
      | colpohysterectomy                                                                |
      | common hepatic artery                                                            |
      | common iliac artery                                                              |
      | complement activation related pseudoallergy                                      |
      | compound nevus                                                                   |
      | congenital hemangiomatosis                                                       |
      | conjunctival melanoma                                                            |
      | contact cheilitis                                                                |
      | contrast enhanced digital mammography                                            |
      | contrast enhanced mammography                                                    |
      | Cooperiidae                                                                      |
      | coracobrachialis muscle                                                          |
      | corneal surgery                                                                  |
      | corrugator supercilii muscle                                                     |
      | corruption                                                                       |
      | cortical mastoidectomy                                                           |
      | cosmetic allergy                                                                 |
      | cosmetic dermatitis                                                              |
      | costocervical trunk                                                              |
      | cradle cap                                                                       |
      | cremasteric artery                                                               |
      | cricoarytenoid muscle                                                            |
      | cricothyroid muscle                                                              |
      | cronyism                                                                         |
      | crustacean allergy                                                               |
      | cutaneous adenoid cystic carcinoma                                               |
      | cutaneous adnexal tumor                                                          |
      | cutaneous amyloidosis                                                            |
      | cutaneous B-cell lymphoma                                                        |
      | cutaneous hamartoma                                                              |
      | cutaneous horn                                                                   |
      | cutaneous leiomyoma                                                              |
      | cylindroma                                                                       |
      | Cystic Fibrosis Questionnaire                                                    |
      | Cystic Fibrosis Questionnaire-Revised                                            |
      | cystoprostatectomy                                                               |
      | Dabska tumor                                                                     |
      | data corruption                                                                  |
      | data error                                                                       |
      | deep brachial artery                                                             |
      | deep circumflex iliac artery                                                     |
      | deep penetrating nevus                                                           |
      | delayed pressure urticaria                                                       |
      | dental abrasion                                                                  |
      | dental attrition                                                                 |
      | dental erosion                                                                   |
      | dental implant failure                                                           |
      | dental restoration failure                                                       |
      | dentin hypersensitivity                                                          |
      | depressor anguli oris muscle                                                     |
      | dermatitis artefacta                                                             |
      | dermatofibroma protuberans                                                       |
      | dermatophytid                                                                    |
      | descending genicular artery                                                      |
      | descending palatine artery                                                       |
      | desmoplastic trichoepithelioma                                                   |
      | device malposition                                                               |
      | Dictyocaulidae                                                                   |
      | diffuse choroidal hemangioma                                                     |
      | diffuse hemangiomatosis                                                          |
      | diffuse neonatal hemangiomatosis                                                 |
      | diffuse optical imaging                                                          |
      | diffuse optical tomography                                                       |
      | digastric muscle                                                                 |
      | distal gastrectomy                                                               |
      | distrust                                                                         |
      | diversity index                                                                  |
      | diverticulectomy                                                                 |
      | diving disorder                                                                  |
      | dopamine dysregulation syndrome                                                  |
      | Dor procedure                                                                    |
      | dorsal interossei                                                                |
      | dorsalis pedis artery                                                            |
      | ductography                                                                      |
      | duodenectomy                                                                     |
      | dynamic contrast enhanced computed tomography                                    |
      | dynamic contrast enhanced imaging                                                |
      | dynamic contrast enhanced ultrasound                                             |
      | dynamic susceptibility contrast                                                  |
      | dysbaric osteonecrosis                                                           |
      | ear barotrauma                                                                   |
      | eccrine acrospiroma                                                              |
      | eccrine hidrocystoma                                                             |
      | eccrine syringofibroadenoma                                                      |
      | ectopic endometrium                                                              |
      | ectopic spleen                                                                   |
      | ectopic tooth                                                                    |
      | EETosis                                                                          |
      | egg white allergy                                                                |
      | egg yolk allergy                                                                 |
      | electromagnetic hypersensitivity                                                 |
      | electroorganic synthesis                                                         |
      | electrosynthesis                                                                 |
      | Elephas                                                                          |
      | Elephas maximus                                                                  |
      | embryo rescue (plant culture)                                                    |
      | enamel hardness                                                                  |
      | enamel pearl                                                                     |
      | endoscopic ligation                                                              |
      | endoscopic thyroidectomy                                                         |
      | endothelial tumor                                                                |
      | endothelioma                                                                     |
      | environmental law                                                                |
      | enzootic nasal adenocarcinoma                                                    |
      | eosinophil extracellular trap                                                    |
      | eosinophil function                                                              |
      | eosinophilic cystitis                                                            |
      | eosinophilic myocarditis                                                         |
      | eosinophilic pleural effusion                                                    |
      | epidermal nevus                                                                  |
      | epidermoid metaplasia                                                            |
      | epididymectomy                                                                   |
      | epithelioid hemangioma                                                           |
      | erethism                                                                         |
      | Escherichia albertii                                                             |
      | esophageal variceal ligation                                                     |
      | esophagectomy                                                                    |
      | ethmoid sinus cancer                                                             |
      | ethmoid sinus carcinoma                                                          |
      | ethmoid sinus tumor                                                              |
      | ETosis                                                                           |
      | eutopic endometrium                                                              |
      | exercise induced allergy                                                         |
      | exercise induced anaphylaxis                                                     |
      | exercise induced bronchospasm                                                    |
      | exercise induced urticaria                                                       |
      | exfoliative cheilitis                                                            |
      | experimental acute respiratory distress syndrome                                 |
      | experimental amyloidosis                                                         |
      | extended producer responsibility                                                 |
      | extensor digitorum brevis muscle                                                 |
      | extensor digitorum muscle                                                        |
      | extensor hallucis longus muscle                                                  |
      | extensor indicis muscle                                                          |
      | extensor pollicis brevis muscle                                                  |
      | extensor pollicis longus muscle                                                  |
      | external anal sphincter                                                          |
      | external iliac artery                                                            |
      | extortion                                                                        |
      | extranodal nasal NK/T cell lymphoma                                              |
      | extranodal natural killer/T-cell lymphoma                                        |
      | exudative pleural effusion                                                       |
      | eyelid melanoma                                                                  |
      | facial artery                                                                    |
      | facial hemangioma                                                                |
      | familial cerebral cavernous malformation                                         |
      | familial melanoma                                                                |
      | favoritism                                                                       |
      | femoral osteotomy                                                                |
      | Ferguson hemorrhoidectomy                                                        |
      | fetal cystic hygroma                                                             |
      | fibroblastic meningioma                                                          |
      | fibrofolliculoma                                                                 |
      | fibrotic hypersensitivity pneumonitis                                            |
      | film mammography                                                                 |
      | flagellate dermatitis                                                            |
      | Flavobacterium columnare                                                         |
      | flea allergy                                                                     |
      | flea allergy dermatitis                                                          |
      | flexor carpi ulnaris muscle                                                      |
      | flexor digitorum longus muscle                                                   |
      | flexor digitorum profundus muscle                                                |
      | flexor digitorum superficialis muscle                                            |
      | flexor hallucis brevis muscle                                                    |
      | flexor hallucis longus muscle                                                    |
      | flexor pollicis brevis muscle                                                    |
      | flexor pollicis longus muscle                                                    |
      | folliculotropic mycosis fungoides                                                |
      | food dependent exercise induced anaphylaxis                                      |
      | food induced anaphylaxis                                                         |
      | food protein induced allergic proctocolitis                                      |
      | food protein induced enterocolitis syndrome                                      |
      | food protein induced enteropathy                                                 |
      | forearm muscle                                                                   |
      | fragrance allergy                                                                |
      | Francisella tularensis subsp. holarctica                                         |
      | frontal sinusotomy                                                               |
      | frontalis muscle                                                                 |
      | fronto-occipital fasciculus                                                      |
      | fruit allergy                                                                    |
      | functional outcomes of sleep questionnaire                                       |
      | functional outcomes of sleep questionnaire-10                                    |
      | fungal allergy                                                                   |
      | Fusarium oxysporum f. sp. cucumerinum                                            |
      | Gastroesophageal Reflux Disease Questionnaire                                    |
      | gastrointestinal cancer                                                          |
      | gene transfer method                                                             |
      | genioglossus muscle                                                              |
      | geniohyoid muscle                                                                |
      | giant congenital melanocytic nevus                                               |
      | glycopenia                                                                       |
      | gold allergy                                                                     |
      | gonadal artery                                                                   |
      | Gorham disease                                                                   |
      | granulomatous dermatitis                                                         |
      | granulomatous pneumonia                                                          |
      | granulomatous slack skin                                                         |
      | greater curvature of the stomach                                                 |
      | greater palatine artery                                                          |
      | greenwashing                                                                     |
      | H4-II cell line                                                                  |
      | Haemonchidae                                                                     |
      | hair follicle tumor                                                              |
      | hardware disease                                                                 |
      | hazelnut allergy                                                                 |
      | heat hypersensitivity                                                            |
      | heat urticaria                                                                   |
      | Heiner syndrome                                                                  |
      | Heligmonellidae                                                                  |
      | hemisternotomy                                                                   |
      | hemithyroidectomy                                                                |
      | hemorrhoid ligation                                                              |
      | hepatectomy                                                                      |
      | hepatic angiosarcoma                                                             |
      | hepatopancreatoduodenectomy                                                      |
      | hereditary deafness                                                              |
      | hidradenocarcinoma                                                               |
      | hidradenoma papilliferum                                                         |
      | hidrocystoma                                                                     |
      | histiocytoma of the lung                                                         |
      | hot snare polypectomy                                                            |
      | hydroa vacciniforme-like lymphoma                                                |
      | hydrogen sulfide poisoning                                                       |
      | Hymenoptera venom allergy                                                        |
      | hyoglossus muscle                                                                |
      | hyperbaric pressure                                                              |
      | hypergeusia                                                                      |
      | hyperosmia                                                                       |
      | hypersensibility                                                                 |
      | hypersensitivity myocarditis                                                     |
      | hypobaric pressure                                                               |
      | hypobaropathy                                                                    |
      | hypoglycemia unawareness                                                         |
      | hypoglycemic seizure                                                             |
      | hyposensitivity (sensory dysfunction)                                            |
      | hypothenar muscle                                                                |
      | hysteroscopic myomectomy                                                         |
      | ICF syndrome                                                                     |
      | ICU triage                                                                       |
      | idiopathic urticaria                                                             |
      | idiosyncratic drug reaction                                                      |
      | IgE mediated food allergy                                                        |
      | ileal artery                                                                     |
      | ileocecal resection                                                              |
      | ileocolectomy                                                                    |
      | ileocolic artery                                                                 |
      | iliacus muscle                                                                   |
      | iliococcygeus muscle                                                             |
      | iliolumbar artery                                                                |
      | impaired hypoglycemia awareness                                                  |
      | implant complication                                                             |
      | implant infection                                                                |
      | indentation hardness                                                             |
      | indolent primary cutaneous T-cell lymphoma                                       |
      | inducible urticaria                                                              |
      | inductively coupled plasma mass spectrometer                                     |
      | infantile eczema                                                                 |
      | infantile hemangioendothelioma                                                   |
      | inferior alveolar artery                                                         |
      | inferior fronto-occipital fasciculus                                             |
      | inferior pancreaticoduodenal artery                                              |
      | inferior pharyngeal constrictor muscle                                           |
      | inferior phrenic artery                                                          |
      | inferior vesical artery                                                          |
      | Informant Questionnaire on Cognitive Decline in the Elderly                      |
      | infrahyoid muscle                                                                |
      | infraorbital artery                                                              |
      | inner ear barotrauma                                                             |
      | internal anal sphincter                                                          |
      | internal pudendal artery                                                         |
      | International Restless Legs Syndrome Study Group Rating Scale                    |
      | intestinal artery                                                                |
      | intestinal loop                                                                  |
      | intracranial meningioma                                                          |
      | intradermal nevus                                                                |
      | intramuscular hemangioma                                                         |
      | intraocular vascular tumor                                                       |
      | intraoral scanner                                                                |
      | intraventricular meningioma                                                      |
      | inverted follicular keratosis                                                    |
      | iodism                                                                           |
      | iridoplasty                                                                      |
      | iris melanoma                                                                    |
      | Irritable Bowel Syndrome Quality of Life                                         |
      | irritant contact dermatitis                                                      |
      | ischiocavernosus muscle                                                          |
      | jejunal artery                                                                   |
      | junctional nevus                                                                 |
      | juvenile nasopharyngeal angiofibroma                                             |
      | Knoop hardness                                                                   |
      | Knoop microhardness                                                              |
      | Kocuria kristinae                                                                |
      | laparoscopic adrenalectomy                                                       |
      | laparoscopic distal gastrectomy                                                  |
      | laparoscopic esophagectomy                                                       |
      | laparoscopic gastrectomy                                                         |
      | laparoscopic hysterectomy                                                        |
      | laparoscopic liver resection                                                     |
      | laparoscopic myomectomy                                                          |
      | laparoscopic nephrectomy                                                         |
      | laparoscopic ovarian cystectomy                                                  |
      | laparoscopic partial nephrectomy                                                 |
      | laparoscopic radical cystectomy                                                  |
      | laparoscopic radical gastrectomy                                                 |
      | laparoscopic radical nephrectomy                                                 |
      | laparoscopic radical trachelectomy                                               |
      | laparoscopic total gastrectomy                                                   |
      | laparoscopic varicocelectomy                                                     |
      | large intestine resection                                                        |
      | laryngeal chondroma                                                              |
      | laryngeal hemangioma                                                             |
      | laryngeal muscle                                                                 |
      | laryngeal sarcoma                                                                |
      | laryngeal schwannoma                                                             |
      | laser in situ keratomileusis                                                     |
      | laser iridotomy                                                                  |
      | laser-assisted subepithelial keratectomy                                         |
      | lateral cricoarytenoid muscle                                                    |
      | lateral plantar artery                                                           |
      | lateral sacral artery                                                            |
      | left atrial appendage closure                                                    |
      | left colic artery                                                                |
      | left gastric artery                                                              |
      | left gastroepiploic artery                                                       |
      | left hepatic artery                                                              |
      | legume allergy                                                                   |
      | Leishmania aethiopica                                                            |
      | leptomeningeal angiomatosis                                                      |
      | leptomeningeal melanoma                                                          |
      | Leptospira grippotyphosa                                                         |
      | Leptospira kirschneri                                                            |
      | lesser curvature of the stomach                                                  |
      | lichen amyloidosis                                                               |
      | linear epidermal nevus                                                           |
      | littoral cell angioma                                                            |
      | long posterior ciliary artery                                                    |
      | longus colli muscle                                                              |
      | lumbar discectomy                                                                |
      | lumbar microdiscectomy                                                           |
      | lumbrical muscle of the hand                                                     |
      | lymph vessel tumor                                                               |
      | lymphangioendothelioma                                                           |
      | macrodontia                                                                      |
      | macrophage extracellular trap                                                    |
      | macular amyloidosis                                                              |
      | magnetic resonance tractography                                                  |
      | malar rash                                                                       |
      | malignant blue nevus                                                             |
      | malignant eccrine spiradenoma                                                    |
      | malignant fibrous histiocytoma of the lung                                       |
      | malignant hair follicle tumor                                                    |
      | malignant hemangiopericytoma                                                     |
      | malignant mesothelioma                                                           |
      | malignant mixed tumor of the skin                                                |
      | malleolar osteotomy                                                              |
      | Manchester-Oxford Foot Questionnaire                                             |
      | maxillary sinus cancer                                                           |
      | maxillary sinus carcinoma                                                        |
      | maxillary sinus tumor                                                            |
      | McKeown esophagectomy                                                            |
      | mechanical hypersensitivity                                                      |
      | medial circumflex femoral artery                                                 |
      | medial malleolar osteotomy                                                       |
      | medial plantar artery                                                            |
      | median sacral artery                                                             |
      | median sternotomy                                                                |
      | medical device erosion                                                           |
      | medical device malfunction                                                       |
      | medical outcomes study sleep scale                                               |
      | melanocytic tumor                                                                |
      | melanocytoma                                                                     |
      | melanoma brain metastasis                                                        |
      | melanoma in situ                                                                 |
      | meningeal hemangiopericytoma                                                     |
      | meningeal melanocytoma                                                           |
      | meningeal melanocytosis                                                          |
      | meningeal melanomatosis                                                          |
      | meningeal tumor                                                                  |
      | meningothelial meningioma                                                        |
      | menopause rating scale                                                           |
      | mentalis muscle                                                                  |
      | mercury allergy                                                                  |
      | meristem culture                                                                 |
      | metal allergy                                                                    |
      | metallosis                                                                       |
      | metastatic rectal cancer                                                         |
      | metastatic uveal melanoma                                                        |
      | methicillin resistant Staphylococcus aureus ST398                                |
      | Michigan hand outcomes questionnaire                                             |
      | microcystic adnexal carcinoma                                                    |
      | microcystic lymphatic malformation                                               |
      | microcystic meningioma                                                           |
      | microdontia                                                                      |
      | microhardness                                                                    |
      | microsurgical varicocelectomy                                                    |
      | middle colic artery                                                              |
      | middle ear barotrauma                                                            |
      | middle meningeal artery                                                          |
      | middle rectal artery                                                             |
      | middle scalene muscle                                                            |
      | Migraine-Specific Quality of Life Questionnaire                                  |
      | milia en plaque                                                                  |
      | miliaria                                                                         |
      | miliaria crystallina                                                             |
      | miliaria rubra                                                                   |
      | Milligan-Morgan hemorrhoidectomy                                                 |
      | millium                                                                          |
      | mini-percutaneous nephrolithotomy                                                |
      | mini-rhinoconjunctivitis quality of life questionnaire                           |
      | minimally invasive esophagectomy                                                 |
      | ministernotomy                                                                   |
      | minithoracotomy                                                                  |
      | Minnesota Living with Heart Failure Questionnaire                                |
      | misophonia                                                                       |
      | mixed tumor of the skin                                                          |
      | modified radical mastoidectomy                                                   |
      | mold allergy                                                                     |
      | mollusc allergy                                                                  |
      | mood and anxiety symptom questionnaire                                           |
      | mosquito allergy                                                                 |
      | mouth muscle                                                                     |
      | mucosa associated lymphoid tissue                                                |
      | Mullen scales of early learning                                                  |
      | Multidimensional Fatigue Inventory                                               |
      | multilobar pneumonia                                                             |
      | multiple food allergy                                                            |
      | multiple keratoacanthomas                                                        |
      | multiple meningioma                                                              |
      | mushroom food allergy                                                            |
      | mylohyoid muscle                                                                 |
      | nail tumor                                                                       |
      | nasal glioma                                                                     |
      | nasal metastasis                                                                 |
      | nasal-associated lymphoid tissue                                                 |
      | National Institutes of Health-chronic prostatitis symptom index                  |
      | Neonatal Infant Pain Scale                                                       |
      | nepotism                                                                         |
      | NETosis                                                                          |
      | neuroglycopenia                                                                  |
      | neuronevus                                                                       |
      | neutrophil extracellular trap                                                    |
      | neutrophil function                                                              |
      | nevi and melanomas                                                               |
      | nevus simplex                                                                    |
      | nevus spilus                                                                     |
      | nickel allergy                                                                   |
      | nitrogen narcosis                                                                |
      | nodular amyloidosis                                                              |
      | nodular cutaneous amyloidosis                                                    |
      | nodular hidradenoma                                                              |
      | nodular melanoma                                                                 |
      | nodular pulmonary amyloidosis                                                    |
      | non IgE mediated food allergy                                                    |
      | non-celiac gluten sensitivity                                                    |
      | Nordic Musculoskeletal Questionnaire                                             |
      | obturator artery                                                                 |
      | obturator externus muscle                                                        |
      | obturator internus muscle                                                        |
      | obtuse marginal artery                                                           |
      | occipitalis muscle                                                               |
      | occupational allergic contact dermatitis                                         |
      | occupational irritant contact dermatitis                                         |
      | ocular hyperemia                                                                 |
      | Odoribacter                                                                      |
      | Odoribacter splanchnicus                                                         |
      | olfactory groove meningioma                                                      |
      | omohyoid muscle                                                                  |
      | onychomatricoma                                                                  |
      | open appendectomy                                                                |
      | open nephrectomy                                                                 |
      | open radical cystectomy                                                          |
      | open source research                                                             |
      | open thyroidectomy                                                               |
      | opening wedge high tibial osteotomy                                              |
      | opponens pollicis muscle                                                         |
      | optical mammography                                                              |
      | oral melanoma                                                                    |
      | orbital atherectomy                                                              |
      | orbitotomy                                                                       |
      | organ-specific autoimmune disease                                                |
      | organic synthesis                                                                |
      | orthodox seed                                                                    |
      | otoacariasis                                                                     |
      | otodectic mange                                                                  |
      | ovarian artery                                                                   |
      | ovarian cystectomy                                                               |
      | overactive bladder questionnaire                                                 |
      | overactive bladder questionnaire-short form                                      |
      | packaging waste                                                                  |
      | Paecilomyces variotii                                                            |
      | palmaris longus muscle                                                           |
      | papillary meningioma                                                             |
      | papulonecrotic tuberculid                                                        |
      | paranasal sinus metastasis                                                       |
      | parapneumonic empyema                                                            |
      | parasagittal meningioma                                                          |
      | partial cystectomy                                                               |
      | partial laryngectomy                                                             |
      | partial splenectomy                                                              |
      | partial superficial parotidectomy                                                |
      | patch clamp amplifier                                                            |
      | Patient Assessment of Constipation Quality of Life                               |
      | Patient Assessment of Constipation Symptoms                                      |
      | patient triage                                                                   |
      | PC-9/ER cell line                                                                |
      | peach allergy                                                                    |
      | pectineus muscle                                                                 |
      | pediatric sleep questionnaire                                                    |
      | pedicle subtraction osteotomy                                                    |
      | pelvic floor impact questionnaire                                                |
      | Pelvic Floor Impact Questionnaire-Short Form                                     |
      | pelvic muscle                                                                    |
      | Pelvic Organ Prolapse Urinary Incontinence Sexual Questionnaire                  |
      | Pelvic Organ Prolapse Urinary Incontinence Sexual Questionnaire-12               |
      | Pelvic Organ Prolapse Urinary Incontinence Sexual Questionnaire-IUGA revised     |
      | percutaneous nephrolithotripsy                                                   |
      | peri-implant fracture                                                            |
      | peri-implant mucositis                                                           |
      | periacetabular osteotomy                                                         |
      | perineal body                                                                    |
      | perineum muscle                                                                  |
      | peroneal muscle                                                                  |
      | peroneus brevis muscle                                                           |
      | peroneus longus muscle                                                           |
      | peroneus tertius muscle                                                          |
      | petroclival meningioma                                                           |
      | phase contrast imaging                                                           |
      | photon counting computed tomography                                              |
      | phototherapeutic keratectomy                                                     |
      | phototoxic dermatitis                                                            |
      | Physical Activity Questionnaire for Adolescents                                  |
      | Physical Activity Questionnaire for Older Children                               |
      | physical urticaria                                                               |
      | phytophotodermatitis                                                             |
      | pigmented dermatofibrosarcoma protuberans                                        |
      | pigmented epithelioid melanocytoma                                               |
      | piloleiomyoma                                                                    |
      | pilomatrix carcinoma                                                             |
      | piriformis muscle                                                                |
      | pistachio allergy                                                                |
      | platinosis                                                                       |
      | pleural solitary fibrous tumor                                                   |
      | pneumonectomy                                                                    |
      | pneumonic effusion                                                               |
      | police violence                                                                  |
      | popliteus muscle                                                                 |
      | positron emission mammography                                                    |
      | posterior auricular artery                                                       |
      | posterior cricoarytenoid muscle                                                  |
      | posterior descending coronary artery                                             |
      | posterior fossa meningioma                                                       |
      | posterior humeral circumflex artery                                              |
      | posterior interosseous artery                                                    |
      | posterior spinal artery                                                          |
      | posterior superior alveolar artery                                               |
      | posterior tibial artery                                                          |
      | posterolateral thoracotomy                                                       |
      | postnasal drip                                                                   |
      | postpneumonic empyema                                                            |
      | poultry meat allergy                                                             |
      | pressure urticaria                                                               |
      | prevention paradox                                                               |
      | primary cutaneous diffuse large B-cell lymphoma leg type                         |
      | primary cutaneous follicle center lymphoma                                       |
      | primary cutaneous lymphoma                                                       |
      | primary cutaneous marginal zone B-cell lymphoma                                  |
      | primary melanocytic tumors of the central nervous system                         |
      | primary melanoma of the central nervous system                                   |
      | primary pulmonary lymphoma                                                       |
      | proliferating trichilemmal tumor                                                 |
      | pronator quadratus muscle                                                        |
      | pronator teres muscle                                                            |
      | prosthesis erosion                                                               |
      | protein contact dermatitis                                                       |
      | proximal gastrectomy                                                             |
      | proximal row carpectomy                                                          |
      | prurigo of pregnancy                                                             |
      | pruritic urticarial papules and plaques of pregnancy                             |
      | pruritus gravidarum                                                              |
      | pseudoallergy                                                                    |
      | pseudoepilepsy                                                                   |
      | pseudomelanoma                                                                   |
      | pseudomyogenic hemangioendothelioma                                              |
      | psoas major muscle                                                               |
      | puborectalis muscle                                                              |
      | pudendal artery                                                                  |
      | pulmonary chondroma                                                              |
      | pulmonary hamartoma                                                              |
      | pulmonary hemangioma                                                             |
      | pulmonary inflammatory myofibroblastic tumor                                     |
      | pulmonary lymphoma                                                               |
      | pulmonary vascular congestion                                                    |
      | pump thrombosis                                                                  |
      | Quality of Life in Childhood Epilepsy Questionnaire                              |
      | radical cystectomy                                                               |
      | radical gastrectomy                                                              |
      | radical mastoidectomy                                                            |
      | radical parotidectomy                                                            |
      | radical vaginal trachelectomy                                                    |
      | reactive attachment disorder                                                     |
      | reactive hyperemia                                                               |
      | recalcitrant seed                                                                |
      | rectal adenocarcinoma                                                            |
      | rectosigmoid resection                                                           |
      | recurrent respiratory papillomatosis                                             |
      | red gastrocnemius muscle                                                         |
      | red meat allergy                                                                 |
      | refractory celiac disease                                                        |
      | refractory obsessive compulsive disorder                                         |
      | renal angiomyolipoma                                                             |
      | renal artery                                                                     |
      | renal interlobar artery                                                          |
      | respiratory papillomatosis                                                       |
      | resternotomy                                                                     |
      | reticulohistiocytoma                                                             |
      | retiform hemangioendothelioma                                                    |
      | retinal angioma                                                                  |
      | retinal artery                                                                   |
      | retinal cavernous hemangioma                                                     |
      | retinal hemangioma                                                               |
      | retroperitoneal laparoscopic partial nephrectomy                                 |
      | retroperitoneal laparoscopic radical nephrectomy                                 |
      | retroperitoneoscopic nephrectomy                                                 |
      | retrosynthesis                                                                   |
      | Revised UCLA Loneliness Scale                                                    |
      | rhinoconjunctivitis quality of life questionnaire                                |
      | rhinophyma                                                                       |
      | rice allergy                                                                     |
      | Riehl melanosis                                                                  |
      | right colic artery                                                               |
      | right gastric artery                                                             |
      | right gastroepiploic artery                                                      |
      | right hepatic artery                                                             |
      | Rivermead Post-Concussion Symptoms Questionnaire                                 |
      | robot-assisted cystectomy                                                        |
      | robot-assisted radical cystectomy                                                |
      | ruminal acidosis                                                                 |
      | ruminative response scale                                                        |
      | sagittal split osteotomy                                                         |
      | Salmonella bongori                                                               |
      | sarcoma of the trachea                                                           |
      | SARS coronavirus (strain HK39849)                                                |
      | SARS-CoV-2 (BetaCov/Beijing/AMMS01/2020)                                         |
      | SARS-CoV-2 (BetaCoV/Wuhan/IVDC-HB-01/2019)                                       |
      | SARS-CoV-2 (clinical isolate Canada/VIDO-01/2020)                                |
      | SARS-CoV-2 (clinical isolate hCoV-19/Czech Republic/NRL 6632 2/2020)             |
      | SARS-CoV-2 (clinical isolate hCoV-19/Hungary/SRC isolate 2/2020)                 |
      | SARS-CoV-2 (clinical isolate human/Liverpool/REMRQ0001/2020)                     |
      | SARS-CoV-2 (clinical isolate Nigeria 484)                                        |
      | SARS-CoV-2 (clinical isolate/Hu/DP/Kng/19-020, Wuhan strain)                     |
      | SARS-CoV-2 (isolate hCoV-19/St Petersburg-3524S/2020)                            |
      | SARS-CoV-2 (isolate NTU02/TWN/human/2020)                                        |
      | SARS-CoV-2 (lineage B.1)                                                         |
      | SARS-CoV-2 (lineage BA.2)                                                        |
      | SARS-CoV-2 (Quebec city/21697/2020)                                              |
      | SARS-CoV-2 (strain BetaCoV/France/IDF0372/2020)                                  |
      | SARS-CoV-2 (strain hCoV-19/Croatia/ZG-297-20/2020)                               |
      | SARS-CoV-2 (strain hCoV-19/Germany/FrankfurtFFM1/2020)                           |
      | SARS-CoV-2 (strain IHUMI-2096)                                                   |
      | SARS-CoV-2 (strain IHUMI-2137)                                                   |
      | SARS-CoV-2 (strain IHUMI-3076)                                                   |
      | SARS-CoV-2 (strain IHUMI-845)                                                    |
      | SARS-CoV-2 (strain KNG)                                                          |
      | SARS-CoV-2 (strain SB2)                                                          |
      | SARS-Cov-2 (variant B.1.1.7 UK/Alpha/mutant 69-70del)                            |
      | SARS-Cov-2 (variant B.1.1.7 UK/Alpha/mutant N501Y)                               |
      | SARS-Cov-2 (variant B.1.1.7 UK/Alpha/mutant N501Y, 69-70del)                     |
      | SARS-Cov-2 (variant B.1.1.7 UK/Alpha/mutant N501Y, 69-70del, P681H)              |
      | SARS-Cov-2 (variant B.1.1.7 UK/Alpha/mutant P681H)                               |
      | SARS-CoV-2 (variant B.1.351 RSA/Beta/mutant D614G)                               |
      | SARS-CoV-2 (variant B.1.351 RSA/Beta/mutant E484K)                               |
      | SARS-CoV-2 (variant B.1.351 RSA/Beta/mutant E484K, D614G)                        |
      | SARS-CoV-2 (variant B.1.351 RSA/Beta/mutant E484K, N501Y)                        |
      | SARS-CoV-2 (variant B.1.351 RSA/Beta/mutant E484K, N501Y, D614G)                 |
      | SARS-CoV-2 (variant B.1.351 RSA/Beta/mutant N501Y, D614G)                        |
      | SARS-Cov-2 (variant B.1.617.2/Delta/India/mutant D614G, D950N)                   |
      | SARS-Cov-2 (variant B.1.617.2/Delta/India/mutant D614G, P681R)                   |
      | SARS-Cov-2 (variant B.1.617.2/Delta/India/mutant D614G, P681R, D950N)            |
      | SARS-Cov-2 (variant B.1.617.2/Delta/India/mutant D950N)                          |
      | SARS-CoV-2 Alpha                                                                 |
      | SARS-CoV-2 Beta                                                                  |
      | SARS-CoV-2 Delta (isolate hCoV-19//Russia/SPE-RII-32759V/2021)                   |
      | SARS-CoV-2 Epsilon                                                               |
      | SARS-CoV-2 Eta                                                                   |
      | SARS-CoV-2 Gamma                                                                 |
      | SARS-CoV-2 Iota                                                                  |
      | SARS-CoV-2 Kappa                                                                 |
      | SARS-CoV-2 Lambda                                                                |
      | SARS-CoV-2 Mu                                                                    |
      | SARS-CoV-2 Omicron                                                               |
      | SARS-CoV-2 Omicron (isolate hCoV-19/Russia/SPE-RII-6086V/2021)                   |
      | SARS-CoV-2 pseudovirus                                                           |
      | SARS-CoV-2 pseudovirus (spike protein (D614G))                                   |
      | SARS-CoV-2 pseudovirus (spike protein (K417N, E484K, N501Y, D614G))              |
      | SARS-CoV-2 S pseudovirus (ct19)                                                  |
      | SARS-CoV-2 Theta                                                                 |
      | SARS-CoV-2 Zeta                                                                  |
      | SARS-CoV-2-CVR-Gla-1 strain                                                      |
      | Scale to Assess Unawareness of Mental Disorder                                   |
      | scalene muscle                                                                   |
      | scalp sarcoma                                                                    |
      | Scandinavian Stroke Scale                                                        |
      | Schwanniomyces                                                                   |
      | Schwanniomyces occidentalis                                                      |
      | Seattle Angina Questionnaire                                                     |
      | sebaceoma                                                                        |
      | sebaceous adenoma                                                                |
      | secondary traumatic stress                                                       |
      | secretory meningioma                                                             |
      | seed allergy                                                                     |
      | seed viability                                                                   |
      | self defeating personality disorder                                              |
      | self fulfilling prophecy                                                         |
      | semisynthesis                                                                    |
      | Senecavirus                                                                      |
      | Senecavirus A                                                                    |
      | sensitive skin                                                                   |
      | septal myectomy                                                                  |
      | sesame allergy                                                                   |
      | severe cutaneous adverse reaction                                                |
      | Shannon index                                                                    |
      | shiitake dermatitis                                                              |
      | shoe dermatitis                                                                  |
      | Shore hardness                                                                   |
      | Short Inflammatory Bowel Disease Questionnaire                                   |
      | short posterior ciliary artery                                                   |
      | Simpson index                                                                    |
      | single-incision laparoscopic appendectomy                                        |
      | single-port laparoscopic appendectomy                                            |
      | sinonasal adenocarcinoma                                                         |
      | sinonasal inverted papilloma                                                     |
      | sinonasal lymphoma                                                               |
      | sinonasal melanoma                                                               |
      | sinonasal sarcoma                                                                |
      | sinonasal squamous cell carcinoma                                                |
      | sinonasal undifferentiated carcinoma                                             |
      | sinus barotrauma                                                                 |
      | sinusotomy                                                                       |
      | skin appendage carcinoma                                                         |
      | skin hypersensitivity                                                            |
      | skin picking disorder                                                            |
      | skindex                                                                          |
      | skindex-16                                                                       |
      | skindex-29                                                                       |
      | Sleep Disturbance Scale for Children                                             |
      | sleeve resection                                                                 |
      | small intestinal loop                                                            |
      | solar elastosis                                                                  |
      | soy allergy                                                                      |
      | sphenoid wing meningioma                                                         |
      | sphenoidotomy                                                                    |
      | spinal artery                                                                    |
      | spinal meningioma                                                                |
      | spindle cell nevus                                                               |
      | spiradenoma                                                                      |
      | spitzoid lesions                                                                 |
      | spitzoid melanoma                                                                |
      | splenic artery                                                                   |
      | splenic hemangioma                                                               |
      | splenius capitis muscle                                                          |
      | splenius cervicis muscle                                                         |
      | splenius muscle                                                                  |
      | squamous cell carcinoma of the colon                                             |
      | squamous cell carcinoma of the rectum                                            |
      | Staphylococcus aureus MW2                                                        |
      | Staphylococcus aureus N315                                                       |
      | Staphylococcus aureus strain Newman                                              |
      | Staphylococcus aureus USA300                                                     |
      | staring spell                                                                    |
      | stasis dermatitis                                                                |
      | stent erosion                                                                    |
      | sternohyoid muscle                                                               |
      | sternothyroid muscle                                                             |
      | Stevens Johnson/toxic epidermal necrolysis overlap syndrome                      |
      | Stewart-Treves syndrome                                                          |
      | stranguria                                                                       |
      | styloglossus muscle                                                              |
      | stylohyoid muscle                                                                |
      | subacute ruminal acidosis                                                        |
      | subclavius muscle                                                                |
      | submental artery                                                                 |
      | suboccipital craniotomy                                                          |
      | subsartorial artery                                                              |
      | subscapular artery                                                               |
      | subtotal colectomy                                                               |
      | subtotal hysterectomy                                                            |
      | subungual melanoma                                                               |
      | suicidal behaviors questionnaire                                                 |
      | suicidal behaviors questionnaire-revised                                         |
      | summer type hypersensitivity pneumonitis                                         |
      | superficial circumflex iliac artery                                              |
      | superficial epigastric artery                                                    |
      | superficial parotidectomy                                                        |
      | superior fronto-occipital fasciculus                                             |
      | superior gluteal artery                                                          |
      | superior pharyngeal constrictor muscle                                           |
      | superior rectal artery                                                           |
      | superior vesical artery                                                          |
      | supinator muscle                                                                 |
      | supracricoid laryngectomy                                                        |
      | supracricoid partial laryngectomy                                                |
      | suprahyoid muscle                                                                |
      | supramalleolar osteotomy                                                         |
      | supraorbital artery                                                              |
      | suprascapular artery                                                             |
      | suprasellar meningioma                                                           |
      | supratrochlear artery                                                            |
      | sural artery                                                                     |
      | suture ligation                                                                  |
      | sweet itch                                                                       |
      | swimming induced pulmonary edema                                                 |
      | syringocystadenoma papilliferum                                                  |
      | systemic autoimmune disease                                                      |
      | systemic contact dermatitis                                                      |
      | tactile hypersensitivity                                                         |
      | Tampa scale for kinesiophobia                                                    |
      | taurodontism                                                                     |
      | tenosynovectomy                                                                  |
      | tensor veli palatini muscle                                                      |
      | teres major muscle                                                               |
      | testicular artery                                                                |
      | textile dermatitis                                                               |
      | thallium poisoning                                                               |
      | thenar muscle                                                                    |
      | thermal hypersensitivity                                                         |
      | thermal urticaria                                                                |
      | thin melanoma                                                                    |
      | thoracic ductography                                                             |
      | thoracic electrode                                                               |
      | thoracoacromial artery                                                           |
      | thoracoscopic esophagectomy                                                      |
      | thyroarytenoid muscle                                                            |
      | thyrocervical trunk                                                              |
      | thyrohyoid muscle                                                                |
      | tibial tubercle osteotomy                                                        |
      | tongue muscle                                                                    |
      | tonsillotomy                                                                     |
      | tooth avulsion                                                                   |
      | tooth impaction                                                                  |
      | tooth luxation                                                                   |
      | tooth wear                                                                       |
      | total colectomy                                                                  |
      | total gastrectomy                                                                |
      | total hysterectomy                                                               |
      | total laryngectomy                                                               |
      | total parotidectomy                                                              |
      | total synthesis                                                                  |
      | total thyroidectomy                                                              |
      | toxic dermatitis                                                                 |
      | Toxicodendron dermatitis                                                         |
      | transhiatal esophagectomy                                                        |
      | transitional meningioma                                                          |
      | transsphenoidal adenomectomy                                                     |
      | transthoracic esophagectomy                                                      |
      | transudate                                                                       |
      | transudative pleural effusion                                                    |
      | transverse cervical artery                                                       |
      | trapeziectomy                                                                    |
      | traumatic reticulopericarditis                                                   |
      | traumatic reticuloperitonitis                                                    |
      | Treponema pallidum subsp. pallidum                                               |
      | trichilemmal carcinoma                                                           |
      | trichoblastic carcinoma                                                          |
      | trichodiscoma                                                                    |
      | trichofolliculoma                                                                |
      | Trichostrongylidae                                                               |
      | trigeminal artery                                                                |
      | trigeminal trophic syndrome                                                      |
      | trigger finger release                                                           |
      | trisectionectomy                                                                 |
      | tropical eosinophilia                                                            |
      | Trunk Impairment Scale                                                           |
      | tubular apocrine adenoma                                                         |
      | turbinectomy                                                                     |
      | tympanomastoidectomy                                                             |
      | type II hypersensitivity                                                         |
      | type III hypersensitivity                                                        |
      | Unified Dyskinesia Rating Scale                                                  |
      | unilateral adrenalectomy                                                         |
      | unilateral laparoscopic adrenalectomy                                            |
      | unilateral nephrectomy                                                           |
      | unique recombinant form                                                          |
      | upper airway cough syndrome                                                      |
      | uremic pruritus                                                                  |
      | ureteral stent symptom questionnaire                                             |
      | urticarial rash                                                                  |
      | uvular muscle                                                                    |
      | vacuum centrifuge                                                                |
      | vagina surgery                                                                   |
      | vaginectomy                                                                      |
      | variceal ligation                                                                |
      | vascular quality of life questionnaire                                           |
      | vascular tissue tumor                                                            |
      | verrucous hemangioma                                                             |
      | vibratory urticaria                                                              |
      | vicarious trauma                                                                 |
      | Vickers hardness                                                                 |
      | Vickers microhardness                                                            |
      | visceral hyperalgesia                                                            |
      | Vohwinkel syndrome                                                               |
      | walnut allergy                                                                   |
      | wart                                                                             |
      | water allergy                                                                    |
      | wheat dependent exercise induced anaphylaxis                                     |
      | white gastrocnemius muscle                                                       |
      | work productivity and activity impairment questionnaire                          |
      | work productivity and activity impairment questionnaire: general health          |
      | work productivity and activity impairment questionnaire: specific health problem |
      | wrist surgery                                                                    |
      | Yale Global Tic Severity Scale                                                   |
      | Zebra fish AB strain                                                             |
      | zinc poisoning                                                                   |
      | zygomaticus major muscle                                                         |

  @C544605
  Scenario Outline: Verify that changed Emtree terms from 2022.02 have been replaced
    Given I set the endpoint for the http request to /rest/searchquery/term/autocomplete
    And I set the queryParam term with value <newTerm>
    And I set the queryParam limit with value 10
    And I set a valid SESSION cookie
    When I execute the http request with method GET
    And the status code of the response is 200
    And the first suggested term is <newTerm>
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
      | newTerm                                  | oldTerm                                                                                    |
      | besilesomab                              | monoclonal antibody BW 250 183                                                             |
      | bevufenogene nofeparvovec                | hmi 102                                                                                    |
      | cabamiquine                              | 6 fluoro 2 [4 (morpholinomethyl) phenyl] 4 [2 (1 pyrrolidinyl) ethylaminomethyl] quinoline |
      | covifenz                                 | covlp vaccine                                                                              |
      | covilo                                   | bbibp-corv vaccine                                                                         |
      | fidrisertib                              | ipn60130                                                                                   |
      | fipaxalparant                            | sar 100842                                                                                 |
      | lintuzumab ac 225                        | actimab a                                                                                  |
      | lixmabegagene relduparvovec              | lys gm101                                                                                  |
      | navepegritide                            | acp 015                                                                                    |
      | nirmatrelvir                             | pf 07321332                                                                                |
      | nirmatrelvir plus ritonavir              | paxlovid                                                                                   |
      | nomlabofusp                              | cti 1601                                                                                   |
      | onterodrimer                             | glucose polymer                                                                            |
      | repagermanium                            | carboxyethylgermanium sesquioxide                                                          |
      | vixicovtogene oboplasmid                 | ag0302-covid19 vaccine                                                                     |
      | zaftuclenegene piruparvovec              | abo 202                                                                                    |
      | zelpultide alfa                          | at 100                                                                                     |
      | zolunicant                               | 18 methoxycoronaridine                                                                     |
      | allergic contact dermatitis              | skin allergy                                                                               |
      | allergy                                  | allergic reaction                                                                          |
      | bronchopulmonary sarcoma                 | lung sarcoma                                                                               |
      | capsule endoscopy                        | video capsule endoscopy                                                                    |
      | clinical dementia rating scale           | Clinical Dementia Rating                                                                   |
      | colectomy                                | colon resection                                                                            |
      | corneal surgery                          | cornea surgery                                                                             |
      | cutaneous melanoma                       | melanoma skin cancer                                                                       |
      | dentin hypersensitivity                  | dentin sensitivity                                                                         |
      | dopamine dysregulation syndrome          | experimental dopamine dysregulation syndrome                                               |
      | erythrodermic psoriasis                  | psoriatic erythroderma                                                                     |
      | esophagectomy                            | esophagus resection                                                                        |
      | femoral osteotomy                        | femur osteotomy                                                                            |
      | fronto-occipital fasciculus              | occipitofrontal fasciculus                                                                 |
      | Gorham disease                           | massive osteolysis                                                                         |
      | hepatectomy                              | liver resection                                                                            |
      | hypobaropathy                            | hypobarism                                                                                 |
      | intestinal loop                          | intestine loop                                                                             |
      | irritant contact dermatitis              | irritant dermatitis                                                                        |
      | laryngeal muscle                         | larynx muscle                                                                              |
      | laser-assisted subepithelial keratectomy | laser epithelial keratomileusis                                                            |
      | lung carcinoma                           | bronchogenic carcinoma                                                                     |
      | maxillary sinus cancer                   | maxilla sinus cancer                                                                       |
      | maxillary sinus carcinoma                | maxilla sinus carcinoma                                                                    |
      | maxillary sinus tumor                    | maxilla sinus tumor                                                                        |
      | metastatic uveal melanoma                | metastatic uvea melanoma                                                                   |
      | miliaria rubra                           | heat rash                                                                                  |
      | nickel allergy                           | nickel hypersensitivity                                                                    |
      | Paecilomyces                             | Byssochlamys                                                                               |
      | Paecilomyces variotii                    | Byssochlamys spectabilis                                                                   |
      | PC-9/ER cell line                        | PC-9/ER cells                                                                              |
      | pelvic muscle                            | pelvis muscle                                                                              |
      | peroneal muscle                          | peroneus muscle                                                                            |
      | pneumonectomy                            | lung resection                                                                             |
      | pseudoepilepsy                           | pseudoepileptic seizure                                                                    |
      | pulmonary artery                         | lung artery                                                                                |
      | renal angiomyolipoma                     | kidney hemangiomyolipoma                                                                   |
      | renal artery                             | kidney artery                                                                              |
      | respiratory papillomatosis               | larynx papillomatosis                                                                      |
      | retinal artery                           | retina artery                                                                              |
      | sagittal split osteotomy                 | sagittal split ramal osteotomy                                                             |
      | SARS-CoV-2 Alpha                         | SARS-CoV-2 variant 501Y.V1                                                                 |
      | SARS-CoV-2 Beta                          | SARS-CoV-2 variant 501Y.V2                                                                 |
      | SARS-CoV-2 Epsilon                       | SARS-CoV-2 variant CAL.20C                                                                 |
      | SARS-CoV-2 Eta                           | SARS-CoV-2 variant VUI-202102/03                                                           |
      | SARS-CoV-2 Gamma                         | SARS-CoV-2 variant 20J/501Y.V3                                                             |
      | SARS-CoV-2 Kappa                         | SARS-CoV-2 VUI-21APR-01                                                                    |
      | SARS-CoV-2 Lambda                        | SARS-CoV-2 Lambda variant                                                                  |
      | SARS-CoV-2 Mu                            | SARS-CoV-2 Mu variant                                                                      |
      | SARS-CoV-2 Omicron                       | SARS-CoV-2 lineage B.1.1.529                                                               |
      | SARS-CoV-2 Theta                         | SARS-CoV-2 lineage P.3                                                                     |
      | splenic artery                           | spleen artery                                                                              |
      | subsartorial artery                      | superficial femoral artery                                                                 |
      | total colectomy                          | total colon resection                                                                      |
      | total gastrectomy                        | total stomach resection                                                                    |
      | trigeminal artery                        | trigeminus artery                                                                          |
      | unilateral nephrectomy                   | uninephrectomy                                                                             |
      | wart                                     | verruca vulgaris                                                                           |
