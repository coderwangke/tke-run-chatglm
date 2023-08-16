PRE_SEQ_LEN=64
LR=1e-4
BASE_PATH=/data
QUANTIZATION_BIT=8
MAX_STEPS=3000

CUDA_VISIBLE_DEVICES=0 python3 web_demo.py \
    --model_name_or_path $BASE_PATH/models/chatglm-6b \
    --ptuning_checkpoint $BASE_PATH/output/adgen-chatglm-6b-pt-$PRE_SEQ_LEN-$LR/checkpoint-$MAX_STEPS \
    --pre_seq_len $PRE_SEQ_LEN \
    --prefix_projection \
    --quantization_bit $QUANTIZATION_BIT