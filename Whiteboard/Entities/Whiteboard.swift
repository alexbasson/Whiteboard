import Foundation

public final class Whiteboard {
  public let name: String
  public var id: String?

  public init(name: String) {
    self.name = name
  }

  public init(name: String, id: String) {
    self.name = name
    self.id = id
  }
}

extension Whiteboard: Equatable {}

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

public enum WhiteboardError: Error {
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
