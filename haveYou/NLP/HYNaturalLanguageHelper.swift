//
//  HYNaturalLanguageHelper.swift
//  haveYou
//
//  Created by Canyon Boak on 3/20/16.
//  Copyright © 2016 Canyon Boak. All rights reserved.
//

import Foundation

class HYNaturalLanguageHelper : NSObject {
    typealias TaggedToken = (String, String?) // Can’t add tuples to an array without typealias. Compiler bug... Sigh.
    
    func tag(text: String, scheme: String) -> [TaggedToken] {
        let options: NSLinguisticTaggerOptions = [.OmitWhitespace, .OmitPunctuation, .OmitOther]
        let tagger = NSLinguisticTagger(tagSchemes: NSLinguisticTagger.availableTagSchemesForLanguage("en"),
                                        options: Int(options.rawValue))
        tagger.string = text
        
        var tokens: [TaggedToken] = []
        
        // Using NSLinguisticTagger
        tagger.enumerateTagsInRange(NSMakeRange(0, text.characters.count), scheme:scheme, options: options) { tag, tokenRange, _, _ in
            let token = (text as NSString).substringWithRange(tokenRange    )
            tokens.append((token, tag))
        }
        return tokens
    }
    
//    class func partOfSpeech(text: String) -> [TaggedToken] {
//        return tag(text, NSLinguisticTagSchemeLexicalClass)
//    }
//    
//    func lemmatize(text: String) -> [TaggedToken] {
//        return tag(text, scheme: NSLinguisticTagSchemeLemma)
//    }
//    
//    func language(text: String) -> [TaggedToken] {
//        return tag(text, scheme: NSLinguisticTagSchemeLanguage)
//    }

}
