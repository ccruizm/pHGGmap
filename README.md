# pHGGmap

<p align="center">
  <img src="Figures/pHGGmap logo.png" alt="pHGGmap logo" width="500"/>
</p>

This repository contains all code and analysis notebooks associated with:

> **Ruiz-Moreno C. & Collot R., et al.**  
> *A high-resolution multimodal map  reveals cancer-myeloid coordination and invasive program in pediatric high-grade glioma.* (2025)

---

## Graphical Abstract

<img src="Figures/Graphical abstract.png" alt="Graphical abstract" width="600"/>

---

## Data Availability

The processed **discovery cohort** (sc/nRNA, snATAC, snMultiome) is publicly deposited at Zenodo:

➡️ **DOI: [10.5281/zenodo.17063631](https://doi.org/10.5281/zenodo.17063631)**  

Data includes:
- sc/nRNA (GEX) (`.cloupe`, `.rds`, `.h5ad`, raw filtered `.h5` + metadata CSVs)  
- snATAC (`.rds`, `.h5ad`, raw filtered `.h5` + metadata CSVs)  

Raw FASTQ files are under controlled access (EGA; see manuscript Methods).  
Spatial transcriptomics datasets used for validation are available at GSE194329, GSE280990, and [Zenodo records](https://zenodo.org/records/1422594).

---

## Repository Structure

This repo mirrors the full analysis workflow. Key directories:
```
├── 01_Preprocessing
│   ├── 01_GEX
│   │   ├── 01a_tidying_up_matrices_plus_doublet_detection_estimates_Ruiz2023.ipynb
│   │   ├── 01b_tidying_up_matrices_Filbin2018_and_Liu2022.ipynb
│   │   ├── 01c_tidying_up_matrices_plus_doublet_detection_estimates_Jessa2022.ipynb
│   │   ├── 01d_tidying_up_matrices_plus_doublet_detection_estimates_DeSisto2023.ipynb
│   │   ├── 01e_clean_doublets_and_merge_matrices.ipynb
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
│   └── 04c_scglue_integration_all_data.ipynb
├── 03_iCNV
│   ├── 01a_numbat_Ruiz2023_first_half.ipynb
│   ├── 01a_numbat_Ruiz2023_second_half.ipynb
│   ├── 01b_numbat_showing_results_Ruiz2023.ipynb
│   ├── 02a_numbat_Jessa2022_multiome_RNA.ipynb
│   ├── 02a_numbat_Jessa2022_sc_RNA.ipynb
│   ├── 02a_numbat_Jessa2022_sn_RNA.ipynb
│   ├── 02b_numbat_showing_results_multiome_Jessa2022.ipynb
│   ├── 02b_numbat_showing_results_sc_Jessa2022.ipynb
│   └── 02b_numbat_showing_results_sn_Jessa2022.ipynb
├── 04_Malignant_cells
│   ├── 01_GEX
│   │   ├── 01_run_nmf.R
│   │   ├── 01_run_nmf.sh
│   │   ├── 02_robust_NMF_MPs.ipynb
│   │   ├── 03a_collecting_public_signatures.ipynb
│   │   ├── 03b_correlation_NMF_MPs_and_public_signatures.ipynb
│   │   ├── 03c_go_analysis.ipynb
│   │   ├── 03d_reference_mapping_against_human_brain_development_atlases.ipynb
│   │   ├── 04_diffusion_map.ipynb
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
│   └── cellular_states.ipynb
├── 06_Vascular_cells
├── 07_Validations
│   ├── 01a_label_trasfer_smartseq2_datasets.ipynb
│   ├── 01b_label_trasfer_DeSisto_et_al.ipynb
│   └── 01c_label_trasfer_Sussman_et_al.ipynb
├── 08_Treatment_effect
│   ├── 01a_beyond_analysis_pDG_atlas.ipynb
│   ├── 01b_beyond_analysis_Ruiz_Sussman.ipynb
│   ├── 01c_beyond_analysis_Ruiz_Sussman_DMG_cases.ipynb
│   ├── 02a_celltype_composition_analysis_LTSR_malignant.ipynb
│   ├── 02b_celltype_composition_analysis_LTSR_myeloid.ipynb
│   ├── 03a_tangram_R5779_TMA2-S6_DMG.ipynb
│   ├── 03b_tangram_R5779_TMA3-S4_DMG.ipynb
│   ├── 04_cellcharter_CosMx_DMG.ipynb
│   ├── 05_stereosite_DMG.ipynb
│   └── 06_cell2location_visium.ipynb
├── Figures
│   ├── Figure_1
│   │   ├── Fig S1C.ipynb
│   │   ├── Fig S1D.ipynb
│   │   └── Fig S1H.ipynb
│   ├── Figure_2
│   │   ├── Fig 2B.ipynb
│   │   ├── Fig 2E.ipynb
│   │   ├── Fig 2F.ipynb
│   │   ├── Fig S2A.ipynb
│   │   ├── Fig S2D.ipynb
│   │   ├── Fig S2G.ipynb
│   │   └── Fig S2H.ipynb
│   ├── Figure_3
│   │   ├── Fig 3A.ipynb
│   │   ├── Fig 3C.ipynb
│   │   ├── Fig 3F.ipynb
│   │   ├── Fig 3G.ipynb
│   │   ├── Fig 3H.ipynb
│   │   └── Fig S3D.ipynb
│   ├── Figure_4
│   │   ├── Fig 4D.ipynb
│   │   ├── Fig 4E,S4E.ipynb
│   │   ├── Fig 4G.ipynb
│   │   └── Fig S4I,S4J.ipynb
│   └── Figure_5
│       ├── Fig 5A,5B,S5C.ipynb
│       ├── Fig 5C,5D,5F,5G,5H,S5G.ipynb
│       ├── Fig 5C.ipynb
│       ├── Fig 5I,5J.ipynb
│       ├── Fig 5L.ipynb
│       ├── Fig 5M,5N,5O,5P.ipynb
│       ├── Fig 5Q,S6X niches in visium,S6X cell tipe estimates visium.ipynb
│       ├── Fig 5R.ipynb
│       ├── Fig S5A,S5B.ipynb
│       ├── Fig S5D,S5F.ipynb
│       ├── Fig S5E.ipynb
│       ├── Fig S5I,S5J.ipynb
│       ├── Fig S6X heatmap tangram markers.ipynb
│       ├── Fig S6X Tangram prediction scores heatmap.ipynb
│       └── Fig S6X - This one is the heatmap of marker of tanmgram cosmx.ipynb
```
Each notebook/script is named by the figure panel or method step it supports, enabling reproducibility.

---

## Methods Overview

- **Sample collection & processing:** Pediatric pHGG biopsies and autopsies from the Princess Máxima Center and collaborators. Nuclei prepared from frozen tissue and profiled using 10x Genomics sc/nRNA-seq, snATAC-seq, and snMultiome kits. Previously published datasets re-analyzed in the Pediatric Diffuse Glioma Multiverse were retrieved from the following repositories: EGAS00001005773, EGAS00001007035, GSE184357, GSE227983, GSE231860, https://data.humantumoratlas.org/publications/hta4_2024_biorxiv_jonathan-h-sussman, and https://singlecell.broadinstitute.org/single_cell/study/SCP147/single-cell-analysis-in-pediatric-midline-gliomas-with-histone-h3k27m-mutation
- **QC & preprocessing:** CellBender for ambient RNA correction, DoubletFinder + scDblFinder for doublet detection, MAD-based thresholds for filtering, Seurat/Signac/ArchR for RNA and ATAC preprocessing.  
- **Integration:** Mosaic integration of RNA-only, ATAC-only, and multiome datasets using MultiVI, GLUE, and Multigrate. Benchmarking with scIB metrics.  
- **Malignant programs:** NMF-based decomposition to identify robust malignant meta-programs. Potency scoring via CytoTRACE2. CNVs inferred using Numbat.  
- **Immune states:** NMF-based decomposition to identify robust myeloid meta-programs.  
- **Epigenetic & GRN inference:** Chromatin programs explored with ArchR, pycisTopic, SCENIC+. Epigenetic plasticity quantified with SEACells and entropy scores.  
- **Spatial validation:** Tangram and Cell2location used to map malignant and immune states onto CosMx and Visium datasets. CellCharter applied to identify multicellular niches.  
- **Treatment analyses:** Single-cell comparisons between therapy-naïve and post-treatment samples reveal therapy-induced shifts in malignant and immune states.

For complete details, see the **Methods** in the manuscript.

---

## Citation

If you use these resources, please cite:

> Ruiz-Moreno C. & Collot R., et al.  
> *A high-resolution multimodal map  reveals cancer-myeloid coordination and invasive program in pediatric high-grade glioma.* (2025).

---

## Acknowledgments

We thank the patients and families who contributed to this research, the clinical teams, sequencing and imaging cores at the Princess Máxima Center, and collaborators worldwide. See manuscript Acknowledgments for full list.

---

## Contact

- Technical/data/code: **Cristian Ruiz-Moreno** – [GitHub Issues](https://github.com/ccruizm/pHGGmap/issues)
