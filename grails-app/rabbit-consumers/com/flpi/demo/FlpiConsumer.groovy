package com.flpi.demo

import com.budjb.rabbitmq.consumer.MessageContext
import com.budjb.rabbitmq.consumer.AutoAck

class FlpiConsumer {
	static def messages = []

    static rabbitConfig = [
        queue: "flpi",
        autoAck: AutoAck.ALWAYS,
        retry: false,
        transacted: false
    ]

    def handleMessage(def body, MessageContext context) {
        println "***********message contents*********"
        println "$body"
        println "***********Ends*********************"

        messages << body
    }
}