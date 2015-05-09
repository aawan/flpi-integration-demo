package com.flp.demo

import com.budjb.rabbitmq.publisher.RabbitMessagePublisher
import com.flpi.demo.FlpiConsumer

class DemoController {
	RabbitMessagePublisher rabbitMessagePublisher

    def index() { }

    def postMessage() {
       	
    	rabbitMessagePublisher.send {
    		exchange = "demographics.exchange"
            body = request.parameters.keySet()[0]
            deliveryMode = 1
        }
    	render "Congratulations Message successfully posted !!!!!!"
    }

    def consumer() {

    }

    def consumeMessages() {
        //render FlpiConsumer.messages
        render(view: "consumeMessages", model: [messages: FlpiConsumer.messages])
    }
}
