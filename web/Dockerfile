FROM python:3.9

ENV CATALOGUE_HOST=catalogue \
    USER_HOST=user \
    CART_HOST=cart \
    SHIPPING_HOST=shipping \
    PAYMENT_HOST=payment \
    RATINGS_HOST=ratings \
    INSTANA_SERVICE_NAME=nginx-web

COPY requirements.txt /

RUN pip install -r requirements.txt
WORKDIR /
COPY static /static
COPY app.py /
ENV FLASK_APP=app.py
EXPOSE 8000
ENTRYPOINT ["flask", "run", "--host", "0.0.0.0", "--port", "8000"]
