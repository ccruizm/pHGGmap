# pHGGmap

<p align="center">
  <img src="Figures/pHGGmap logo.png" alt="pHGGmap logo" width="500"/>
</p>

This repository contains all code and analysis notebooks associated with:


> **Ruiz-Moreno C., Collot R., et al.**\
> **Cancer-myeloid cell invasive program in pediatric-type diffuse high-grade glioma.**\
> *bioRxiv* (2026)\
> https://doi.org/10.64898/2026.01.23.701142

---

## Graphical Abstract

<p align="center">
  <img src="Figures/Graphical abstract.png" alt="Graphical abstract" width="600"/>
</p>

---

## Data Availability

The processed **discovery and validation cohorts** (sc/nRNA, snATAC, snMultiome) are publicly available at Zenodo:

➡️ **DOI: [10.5281/zenodo.17063631](https://doi.org/10.5281/zenodo.17063631)**  

The Zenodo record includes:

### Discovery Cohort

-   Processed sc/nRNA-seq (GEX)
-   Processed snATAC-seq
-   snMultiome (paired RNA+ATAC; matched barcodes)
-   Seurat (.rds) and AnnData (.h5ad) objects
-   Filtered raw count matrices (.h5)
-   ATAC fragment files (.tsv.gz + .tbi)
-   Harmonized metadata tables

### Validation Cohort

-   Reference-mapped Seurat and AnnData objects
-   Harmonized annotations in shared embedding space
-   Count matrices and metadata tables 

Raw FASTQ files are under controlled access (EGA; see manuscript Methods).  
Spatial transcriptomics datasets used for validation are available at GSE194329, GSE280990, and [Zenodo records](https://zenodo.org/records/1422594).

---

## Repository Structure

This repo mirrors the full analysis workflow. Key directories:
```
pHGGmap
├── 01_Preprocessing
│   ├── 01_GEX
│   │   ├── 01a_tidying_up_matrices_plus_doublet_detection_estimates_Ruiz2023.ipynb
│   │   ├── 01b_tidying_up_matrices_Filbin2018_and_Liu2022.ipynb
│   │   ├── 01c_tidying_up_matrices_plus_doublet_detection_estimates_Jessa2022.ipynb
│   │   ├── 01d_tidying_up_matrices_plus_doublet_detection_estimates_DeSisto2023.ipynb
│   │   ├── 01e_clean_doublets_and_merge_matrices.ipynb
│   │   ├── 01f_tyding_up_Labelle2025.ipynb
│   │   ├── 01g_tyding_up_Sussman2024.ipynb
│   │   ├── 02a_mad_qc_and_retained_protein_coding_genes.ipynb
│   │   ├── 02b_explore_MAD_thresholds_and_cell_type_gain_or_loss.ipynb
│   │   └── 02c_generating_preliminary_annotation_for_integration_benchmarking_using_azimuth_predictions_from_core_GBmap.ipynb
│   └── 02_ATAC
│       ├── 01_creating_common_peak_set.ipynb
│       ├── 02a_qc_atac.ipynb
│       ├── 02b_qc_multiome.ipynb
│       ├── 03a_doublet_detection_atac.ipynb
│       ├── 03b_doublet_detection_multiome.ipynb
│       ├── 04a_exploring_integration.ipynb
│       ├── 04b_exploring_integration_removing doublets.ipynb
│       ├── 05_exporting_matrices_for_multiome_integration.ipynb
│       └── 06_archr_preprocessing_and_subsetting_based_on_qced_signac_outcome.ipynb
├── 02_Integration
│   ├── 01_exporting_matrices_for_mosaic_integration.ipynb
│   ├── 02a_multiVI_subset_filtering_modality_correction.ipynb
│   ├── 02b_multiVI_subset_filtering_sampleID_correction.ipynb
│   ├── 02c_scglue_subset_modality_correction_and_covariate.ipynb
│   ├── 02d_scglue_subset_modality_correction.ipynb
│   ├── 02e_multigrate_subset_modality_correction_and_covariate.ipynb
│   ├── 02f_multigrate_subset_modality_correction.ipynb
│   ├── 03a_scib_comparison_integration_tools_selected_metrics.ipynb
│   ├── 03b_scib_comparison_integration_tools_umap.ipynb
│   ├── 04a_exporting_matrices_for_scglue_integration_all_data.ipynb
│   ├── 04b_scglue_pre_processing_all_data.ipynb
│   ├── 04c_scglue_integration_all_data.ipynb
│   ├── 04d_expression_main_comparments.ipynb
│   ├── 05a_cellular_composition_gex.ipynb
│   ├── 05b_cellular_composition_atac.ipynb
│   ├── 06a_gex_QC_metrics.ipynb
│   └── 06b_atac_QC_metrics.ipynb
├── 03_iCNV
│   ├── 01a_numbat_Ruiz2023_first_half.ipynb
│   ├── 01a_numbat_Ruiz2023_second_half.ipynb
│   ├── 01b_numbat_showing_results_Ruiz2023.ipynb
│   ├── 02a_numbat_Jessa2022_multiome_RNA.ipynb
│   ├── 02a_numbat_Jessa2022_sc_RNA.ipynb
│   ├── 02a_numbat_Jessa2022_sn_RNA.ipynb
│   ├── 02b_numbat_showing_results_multiome_Jessa2022.ipynb
│   ├── 02b_numbat_showing_results_sc_Jessa2022.ipynb
│   ├── 02b_numbat_showing_results_sn_Jessa2022.ipynb
│   └── 02c_exporting_consensus_iCNV_profiles.ipynb
├── 04_Malignant_cells
│   ├── 01_GEX
│   │   ├── 01_run_nmf.R
│   │   ├── 01_run_nmf.sh
│   │   ├── 02_robust_NMF_MPs.ipynb
│   │   ├── 03a_collecting_public_signatures.ipynb
│   │   ├── 03b_correlation_NMF_MPs_and_public_signatures.ipynb
│   │   ├── 03c_reference_mapping_against_human_brain_development_atlases.ipynb
│   │   ├── 04a_diffusion_map.ipynb
│   │   ├── 04b_expression_top_markers.ipynb
│   │   ├── 04c_cop_vs_oligodendrocyte_references_and_atlas.ipynb
│   │   ├── 04d_tumor_reactive_states.ipynb
│   │   └── 05_cytotrace2.ipynb
│   └── 02_ATAC
│       ├── 01a_split_fragment_file_cell_type_fetal.ipynb
│       ├── 01b_compile_fragments_atac_multiome_Mannens2024.ipynb
│       ├── 02_achr_enrichment.ipynb
│       ├── 03a_exporting_annotated_rna_atac_for_SCENIC+.ipynb
│       ├── 03b_pycistopic.ipynb
│       ├── 03c_SCENIC+.ipynb
│       ├── 04a_archr_modified_pipeline_for_seacells.ipynb
│       ├── 04b_creating_anndata_from_archr_modified_pipeline.ipynb
│       ├── 04c_seacell_computation_atac.ipynb
│       ├── 04d_seacell_computation_rna_downsampled.ipynb
│       └── 04e_epigenetic_plasticity.ipynb
├── 05_Immune_cells
│   ├── 01_run_nmf.R
│   ├── 01_run_nmf.sh
│   ├── 02_robust_NMF_MPs.ipynb
│   ├── 03a_correlation_NMF_MPs_and_public_signatures.ipynb
│   ├── 03b_marker_genes_MPs.ipynb
│   ├── 03c_module_comparison_mg_MPs_with_control_mg.ipynb
│   ├── 03_immunosuppresive_MPs.ipynb
│   ├── 04a_MPs_comparison with_cell_ontogeny.ipynb
│   ├── 04b_TAMCs_mdm_and_mg.ipynb
│   ├── 05a_immunomodulatory_MPs.ipynb
│   └── 05b_enrichment_analyses_immunomodulatory_MPs.ipynb
├── 06_Validations
│   ├── 01a_label_trasfer_smartseq2_datasets.ipynb
│   ├── 01b_label_trasfer_DeSisto_et_al.ipynb
│   ├── 01c_label_trasfer_Sussman_et_al.ipynb
│   ├── 02a_validation_malignant_states_external_datasets.ipynb
│   └── 02b_validation_myeloid_states_external_datasets.ipynb
├── 07_Therapy
│   ├── 01_poisson_linear_mixed_model.ipynb
│   ├── 02a_celltype_composition_analysis_LTSR_Ruiz_Sussman.ipynb
│   ├── 02b_cell_distribution_diagnosis_vs_relapse_malignant_myeloid.ipynb
│   └── 02c_changes_TAMCs_by_ontogeny_diagnosis_vs_relapse.ipynb
├── 08_Multicellular_communities_and_spatial_niches
│   ├── 01_beyond_analysis_Ruiz_Sussman_DMG_cases.ipynb
│   ├── 02a_tangram_R5779_TMA2-S6_DMG.ipynb
│   ├── 02b_tangram_R5779_TMA3-S4_DMG.ipynb
│   ├── 02c_tangram_predictions.ipynb
│   ├── 03a_cellcharter_CosMx_DMG.ipynb
│   ├── 03b_cellcharter_malignant_myeloid_and_spatial_signatures.ipynb
│   ├── 03c_saptial_signatures_scores.ipynb
│   ├── 04a_cell2location_visium.ipynb
│   ├── 04b_cell2location_niches.ipynb
│   ├── 05a_invasivity_niches_and_RG_like.ipynb
│   ├── 05b_visium_invasiveness_signature.ipynb
│   ├── 06_rg_subpopulations.ipynb
│   └── 07_cell2location_Kordowski2025.ipynb
├── 09_DMG_with_abdominal_metastasis
│   ├── 01a_mapping_ascites_case_to_pHGGmap.ipynb
│   ├── 01b_diffusion_map_primary_tumor_and_ascites.ipynb
│   ├── 02_invasivity_hypoxia_scores_RG_like_ascites.ipynb
│   ├── 03_expression_markers_immune_cells_ascites.ipynb
│   ├── 04_enrichement_myeloid_ascites.ipynb
│   ├── 05a_paga_blood_ascites_myeloid.ipynb
│   ├── 05b_mapping_myeloid_ascites_to_Nieto2021.ipynb
│   ├── 06_overlap_RG_complement_TAM.ipynb
│   └── 07_cell_dynamics_pre_post_ttx.ipynb
├── 10_Technical_note
│   ├── 01_explianed_variability.ipynb
│   ├── 02_celltype_composition_analysis_LTSR_cell_vs_nucleus.ipynb
│   └── 03_difference_between_cell_vs_nuclei_myeloid.ipynb
├── Figures
│   ├── Graphical abstract.png
│   └── pHGGmap logo.png
└── README.md
```
Each notebook/script is named by the method step it
supports to maximize reproducibility.

---

## Methods Overview

- **Sample collection & processing:** Pediatric pHGG biopsies and autopsies from the Princess Máxima Center and collaborators. Nuclei prepared from frozen tissue and profiled using 10x Genomics sc/nRNA-seq, snATAC-seq, and snMultiome kits. Previously published datasets re-analyzed in the Pediatric Diffuse Glioma Multiverse were retrieved from the following repositories: EGAS00001005773, EGAS00001007035, GSE184357, GSE227983, GSE231860, https://data.humantumoratlas.org/publications/hta4_2024_biorxiv_jonathan-h-sussman, and https://singlecell.broadinstitute.org/single_cell/study/SCP147/single-cell-analysis-in-pediatric-midline-gliomas-with-histone-h3k27m-mutation
- **QC & preprocessing:** RNA and ATAC data were processed using CellRanger/ARC, followed by ambient RNA correction (CellBender), consensus doublet removal (DoubletFinder + scDblFinder), and MAD-based quality filtering. ATAC peak sets were unified across samples. Data were processed using Seurat, Signac, and ArchR.
- **Multimodal integration:** RNA-only, ATAC-only, and multiome datasets were integrated using GLUE following benchmarking against MultiVI and Multigrate (scIB metrics). Malignant cells were identified using haplotype-aware CNV inference (Numbat).
- **Meta-program discovery:** Within each tumor, non-negative matrix factorization (NMF) identified variable gene programs, which were aggregated across patients to define recurrent malignant and myeloid meta-programs. Developmental hierarchies were reconstructed using diffusion maps and reference mapping to human brain atlases. Stemness was quantified with CytoTRACE2. 
- **Epigenetic & GRN inference:** Chromatin programs explored with ArchR, pycisTopic, SCENIC+. Epigenetic plasticity quantified with entropy scores.
- **Multicellular communities:** Cell-type proportions were analyzed using the BEYOND pipeline, revealing conserved cancer–myeloid communities and therapy-associated remodeling. Variance in composition was quantified using Poisson linear mixed models.
- **Spatial mapping:** Tangram and Cell2location projected cell states onto Visium and CosMx datasets. CellCharter identified spatially coherent multicellular niches, including an invasive RG-like–complement macrophage axis.  

For complete details, see the **Methods** in the manuscript.

---

## Citation

If you use these resources, please cite:

> Ruiz-Moreno C. & Collot R., et al.  
> *Cancer-myeloid cell invasive program in pediatric-type diffuse high-grade glioma.* (2026).

Once the peer-reviewed version is available, please cite the published article instead.

---

## Acknowledgments

We thank the patients and families who contributed to this research, the clinical teams, sequencing and imaging cores at the Princess Máxima Center, and collaborators worldwide. See manuscript Acknowledgments for full list.

---

## Contact

- Technical/data/code: **Cristian Ruiz-Moreno** – [GitHub Issues](https://github.com/ccruizm/pHGGmap/issues)
