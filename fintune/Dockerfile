FROM nvidia/cuda:12.1.0-base-ubuntu22.04

RUN apt update && apt install -y git python3 python3-pip

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /app

RUN git clone https://github.com/THUDM/ChatGLM-6B

WORKDIR /app/ChatGLM-6B

RUN pip install -r requirements.txt

RUN pip install rouge_chinese nltk jieba datasets

WORKDIR /app/ChatGLM-6B/ptuning

COPY run_web.sh /app/ChatGLM-6B/ptuning/run_web.sh

RUN sed -i "s/demo.queue().launch(share=False, inbrowser=True)/demo.queue(max_size=20).launch(server_name=\"0.0.0.0\")/g" /app/ChatGLM-6B/ptuning/web_demo.py

ENTRYPOINT ["bash", "run_web.sh"]