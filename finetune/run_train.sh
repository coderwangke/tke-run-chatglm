PRE_SEQ_LEN=64
LR=1e-4
BASE_PATH=/data
QUANTIZATION_BIT=8
MAX_STEPS=3000

CUDA_VISIBLE_DEVICES=0 python3 main.py \
    --do_train \
    --train_file $BASE_PATH/datasets/train.json \
    --validation_file $BASE_PATH/datasets/dev.json \
    --prompt_column content \
    --response_column summary \
    --overwrite_cache \
    --model_name_or_path $BASE_PATH/models/chatglm-6b \
    --output_dir $BASE_PATH/output/adgen-chatglm-6b-pt-$PRE_SEQ_LEN-$LR \
    --overwrite_output_dir \
    --max_source_length 64 \
    --max_target_length 64 \
    --per_device_train_batch_size 1 \
    --per_device_eval_batch_size 1 \
    --gradient_accumulation_steps 16 \
    --predict_with_generate \
    --max_steps $MAX_STEPS \
    --logging_steps 10 \
    --save_steps 1000 \
    --learning_rate $LR \
    --pre_seq_len $PRE_SEQ_LEN \
    --prefix_projection \
    --quantization_bit $QUANTIZATION_BIT