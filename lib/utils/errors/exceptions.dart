class ServerException implements Exception{}
class EmptyCashException implements Exception{}
class WrongDataException implements Exception{
  WrongDataException(String this.message);
  final message;
}
class UserNameException implements Exception{}
class BlockedException implements Exception{}
