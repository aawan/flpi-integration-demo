package com.flp.demo

import com.budjb.rabbitmq.publisher.RabbitMessagePublisher

class DemoController {
	RabbitMessagePublisher rabbitMessagePublisher

    def index() { }

    def postMessage() {
       	println "${request.dump()}"
       	println "params"
       	println "${request.parameters}"
       	println "${request.parameters.getClass()}"
       	println "${request.parameters.keySet()[0]}"

    	//rabbitMessagePublisher.send {
    		//exchange = "demographics.exchange"
            //body = request.JSON
        //}
    	render "Congratulations Message successfully posted !!!!!!"
    }

    def consumer() {

    }

    def consumeMessages() {
        render "Congratulations Started Consuming Messages !!!!!!"	
    }
}
