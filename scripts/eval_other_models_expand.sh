BASEMODELS=("gpt-3.5-turbo" "gpt-4o" "Qwen2-7B" "Llama-3-8B" "Mistral-7B" "Deepseek-7b")
DATASETS=("xsum")

# Entropy, Likelihood LogRank
for BASEMODEL in "${BASEMODELS[@]}" 
do
        for DATASET in "${DATASETS[@]}" 
        do
                python ./other_models/baselines.py \
                --dataset_file=./data/expand/${BASEMODEL}/${DATASET}_expand_${BASEMODEL} \
                --output_file=./other_model_results/expand/${BASEMODEL}/${DATASET}_expand_${BASEMODEL} \
                --scoring_model_name=gpt-neo-2.7B \
                --cache_dir=./models \
                --seed=42 \
                --dataset=$DATASET
        done
done

# detect_gpt
for BASEMODEL in "${BASEMODELS[@]}"
do
        for DATASET in "${DATASETS[@]}" 
        do
                python ./other_models/detect_gpt.py \
                --dataset_file=./data/expand/${BASEMODEL}/${DATASET}_expand_${BASEMODEL} \
                --output_file=./other_model_results/expand/${BASEMODEL}/${DATASET}_expand_${BASEMODEL} \
                --scoring_model_name=gpt-neo-2.7B \
                --mask_filling_model_name=t5-3b \
                --cache_dir=./models \
                --seed=42 \
                --dataset=$DATASET
        done
done

# LRR NPR
for BASEMODEL in "${BASEMODELS[@]}"
do
        for DATASET in "${DATASETS[@]}"
        do
                python ./other_models/detect_llm.py \
                --dataset_file=./data/expand/${BASEMODEL}/${DATASET}_expand_${BASEMODEL}.t5-3b.perturbation_100 \
                --output_file=./other_model_results/expand/${BASEMODEL}/${DATASET}_expand_${BASEMODEL} \
                --scoring_model_name=gpt-neo-2.7B \
                --cache_dir=./models \
                --seed=42 \
                --dataset=$DATASET
        done
done

# dnagpt
for BASEMODEL in "${BASEMODELS[@]}"
do
        for DATASET in "${DATASETS[@]}" 
        do
                python ./other_models/dna_gpt.py \
                --dataset_file=./data/expand/${BASEMODEL}/${DATASET}_expand_${BASEMODEL} \
                --output_file=./other_model_results/expand/${BASEMODEL}/${DATASET}_expand_${BASEMODEL} \
                --base_model_name=gpt-neo-2.7B \
                --cache_dir=./models \
                --seed=42 \
                --dataset=$DATASET
        done
done

# fast_detect_gpt_gptj_neo2.7
for BASEMODEL in "${BASEMODELS[@]}"
do
        for DATASET in "${DATASETS[@]}" 
        do
                python ./other_models/fast_detect_gpt.py \
                --dataset_file=./data/expand/${BASEMODEL}/${DATASET}_expand_${BASEMODEL} \
                --output_file=./other_model_results/expand/${BASEMODEL}/${DATASET}_expand_${BASEMODEL} \
                --scoring_model_name=gpt-neo-2.7B \
                --reference_model_name=gpt-j-6B \
                --cache_dir=./models \
                --seed=42 \
                --dataset=$DATASET
        done
done
