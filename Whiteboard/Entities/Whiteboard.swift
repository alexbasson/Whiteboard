import Foundation

public final class Whiteboard: NSObject, NSCoding {
  public let name: String
  public var id: String?

  public init(name: String) {
    self.name = name
  }

  public init(name: String, id: String) {
    self.name = name
    self.id = id
  }

  struct Keys {
    static let ID = "id"
    static let Name = "name"
  }

  public func encode(with archiver: NSCoder) {
    archiver.encode(name, forKey: Keys.Name)
    if let id = id {
      archiver.encode(id, forKey: Keys.ID)
    }
  }

  required convenience public init(coder unarchiver: NSCoder) {
    let name = unarchiver.decodeObject(forKey: Keys.Name) as! String
    if let id = unarchiver.decodeObject(forKey: Keys.ID) as? String {
      self.init(name: name, id: id)
    } else {
      self.init(name: name)
    }
  }

}

public func ==(lhs: Whiteboard, rhs: Whiteboard) -> Bool {
  return lhs.id == rhs.id && lhs.name == rhs.name
}

public enum WhiteboardField {
  case Name
}

extension WhiteboardField: Equatable {}

public func ==(lhs: WhiteboardField, rhs: WhiteboardField) -> Bool {
  return true
}

public enum ValidationConstraint {
  case Required
  case Unique
}

extension ValidationConstraint: Equatable {}

public func==(lhs: ValidationConstraint, rhs: ValidationConstraint) -> Bool {
  switch (lhs, rhs) {
  case (.Required, .Required):
    return true
  case (.Unique, .Unique):
    return true
  default:
    return false
  }
}

public enum WhiteboardError: ErrorProtocol {
  case Validation(field: WhiteboardField, validation: ValidationConstraint)
  case Update
  case Destroy
}

extension WhiteboardError: Equatable {}

public func ==(lhs: WhiteboardError, rhs: WhiteboardError) -> Bool {
  switch(lhs, rhs) {
  case (let .Validation(field1, validation1), let .Validation(field2, validation2)):
    return field1 == field2 && validation1 == validation2
  case (.Update, .Update):
    return true
  case (.Destroy, .Destroy):
    return true
  default:
    return false
  }
}
