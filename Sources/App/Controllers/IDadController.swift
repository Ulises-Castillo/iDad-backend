//
//  IDadController.swift
//  App
//
//  Created by Ulysses Castillo on 8/28/19.
//

import Vapor

/// Controls basic CRUD operations on `IDads`s.
final class IDadController: RouteCollection {
    
    lazy var iDads = mockData()
    
    var protobufResponse: HTTPResponse {
        let protobuf = try! iDads.serializedData() //TODO: test .serializedData()
        return HTTPResponse(status: .ok, headers: ["Content-Type": "application/octet-stream"], body: protobuf)
    }
    
    func boot(router: Router) throws {
        let userRoute = router.grouped("iDads")
        userRoute.get(use: index)
    }
    
    /// Returns a list of all `IDads`s.
    func index(_ req: Request) throws -> HTTPResponse {
        return protobufResponse
    }
    
    func mockData() -> IDadList {
        var jbp = IDad()
        jbp.name = "Jordan Peterson"
        jbp.imageNames = ["jbp", "jbp3"]
        jbp.videoCodes = ["wLvd_ZbX1w0","-5RCmu-HuTg", "5ER1LOarlgg", "s1tS7ylRVHw", "4OmC6LyO5QI"]
        jbp.quotes = ["The meaning in life is found in the adoption of resposibiilty.",
                      "Imagine your life in 10 years if instead of avoiding the things you know you should do you actually did them every single day–that's powerful.",
                      "The purpose of life is finding the largest burden that you can bear and bearing it.",
                      "If you fulfill your obligations everyday you don't need to worry about the future.",
                      "It took untold generations to get you where you are. A little gratitude might be in order. If you're going to insist on bending the world to your way, you better have your reasons.",
                      "RULE 4 COMPARE YOURSELF TO WHO YOU WERE YESTERDAY, NOT TO WHO SOMEONE ELSE IS TODAY",
                      "To suffer terribly and to know yourself as the cause: that is Hell."]
        
        var book = Book()
        book.title = "12 Rules For Life"
        book.imageName = "12rules"
        book.url = "https://www.amazon.com/12-Rules-Life-Antidote-Chaos/dp/0345816021"
        
        var book2 = Book()
        book2.title = "Maps of Meaning"
        book2.imageName = "mom"
        book2.url = "https://www.amazon.com/Maps-Meaning-Architecture-Jordan-Peterson/dp/0415922216/ref=sr_1_3?keywords=maps+of+meaning&qid=1566760997&s=books&sr=1-3"
        
        jbp.books = [book, book2]
        
        
        var dsp = IDad()
        dsp.name = "Dan Peña"
        dsp.imageNames = ["dsp", "dspQuote"]
        dsp.videoCodes = ["YwmO_aZRmqE", "ZYk18h1o5T0", "_jtRTa826qk", "5Qt64XLtMJE"]
        dsp.quotes = ["Tough times don’t last – tough people do!",
                      "Don’t waste time on things you can’t change!",
                      "Show me your friends and I’ll show you your future.",
                      "Once you become fearless, life becomes limitless.",
                      "Man's greatest burden is unfufilled potential."]
        
        var book3 = Book()
        book3.title = "Your First 100 Million"
        book3.imageName = "first100"
        book3.url = "https://archive.org/details/DanS.PeaYourFirst100Million2ndEd/page/n13"
        
        dsp.books = [book3]
        
        
        var spj = IDad()
        spj.name = "Steve Jobs"
        spj.imageNames = ["spj", "spj3"]
        spj.videoCodes = ["UF8uR6Z6KLc", "ppXQMsj6Yfo", "gFE-Tdz24hM"]
        spj.quotes = ["The people who are crazy enough to think they can change the world are the ones who do.",
                      "Have the courage to follow your heart and intuition. They somehow know what you truly want to become.",
                      "I'm convinced that about half of what separates successful entrepreneurs from the non-successful ones is pure perseverance.",
                      "My favorite things in life don't cost any money. It's really clear that the most precious resource we all have is time."]
        
        var book4 = Book()
        book4.title = "Steve Jobs, By Walter Issacson"
        book4.imageName = "issacson"
        book4.url = "https://www.amazon.com/Steve-Jobs-Walter-Isaacson/dp/1451648537"
        
        spj.books = [book4]
        
        
        var iDads = IDadList()
        iDads.list = [jbp, dsp, spj]
        
        return iDads
    }
}
