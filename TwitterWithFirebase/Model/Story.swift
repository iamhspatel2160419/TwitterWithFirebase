
import Foundation
import Firebase

class Story
{
    var text = ""
    var numberOfLikes = 0
    var numberOfAngry = 0
    let ref : DatabaseReference!

    init(text:String)
    {
        self.text = text
        ref = Database.database().reference().child("stories").childByAutoId()
    }
    init(snapshot:DataSnapshot)
    {
        ref = snapshot.ref
        if let value = snapshot.value as? [String:Any]
        {
            text = value["text"] as! String
            numberOfLikes = value["numberOfLikes"] as! Int
            numberOfAngry = value["numberOfAngry"] as! Int
        }
    }
    
    func save()
    {
        ref.setValue(toAnyObject())
    }
    func toAnyObject() -> [String:Any]
    {
        return [
            "text": self.text,
            "numberOfLikes" : self.numberOfLikes,
            "numberOfAngry" : self.numberOfAngry
        ]
    }
    
}
extension Story
{
    func Like()
    {
        numberOfLikes+=1
        ref.child("numberOfLikes").setValue(numberOfLikes)
        
    }
}
