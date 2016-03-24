class IndexController < ApplicationController
    def display
        @message = "Hello, world!"
        @img1source = "http://designoval.com/wp-content/uploads/2015/05/desktop_backgrounds.jpg"
        @img2source = "http://fulldesktopbackgrounds.com/wp-content/uploads/2015/12/desktop-backrounds.jpg"
        @img3source = "http://cdn.wonderfulengineering.com/wp-content/uploads/2016/01/Desktop-Background-11.jpg"
    end
end
