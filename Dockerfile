FROM python:3.11-slim

# Create user with UID 1000
RUN useradd -m -u 1000 user
USER user
ENV HOME=/home/user \
	PATH=/home/user/.local/bin:$PATH \
    APP_PORT=7057

WORKDIR $HOME/app

COPY --chown=user . $HOME/app
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

EXPOSE 7057

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "7057"]
