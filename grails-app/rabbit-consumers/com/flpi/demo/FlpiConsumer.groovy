package com.flpi.demo

import com.budjb.rabbitmq.consumer.MessageContext

class FlpiConsumer {
    static rabbitConfig = [
        "exchange": "demographics.exchange"
    ]

    def handleMessage(def body, MessageContext context) {
        println "***********message contents*********"
        println "$body"
        println "***********Ends*********************"
        return "success"
    }
}