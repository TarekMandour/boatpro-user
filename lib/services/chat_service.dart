import 'package:dartz/dartz.dart';
import 'package:example/models/conversation.dart';
import 'package:example/models/rate.dart';
import 'package:example/models/user_model.dart';

import 'package:example/ui/index.dart';

class ChatService {
  Future<Either<Failure, ListResponse<UserModel>>> getChats() async {
    try {
      final response = await DioFactory.get(Url.baseUrl + Url.user + Url.chat);
      final result = ListResponse.fromJson(
          response?.data, (json) => UserModel.fromJson(json));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, ListResponse<ConversationModel>>> getThreadChat(
      String id) async {
    try {
      final response = await DioFactory.get(
          Url.baseUrl + Url.user + Url.chat + Url.threads + "/$id");
      final result = ListResponse.fromJson(
          response?.data, (json) => ConversationModel.fromJson(json));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, ListResponse>> sendMessage({
    required String reciverId,
    required String message,
  }) async {
    try {
      Map<String, dynamic> data = {
        Url.receiverIdKey: reciverId.toString(),
        Url.messageKey: message.toString(),
      };
      final formData = FormData.fromMap(data);
      final response = await DioFactory.post(
          Url.baseUrl + Url.user + Url.chat + Url.store, formData);
      final result = ListResponse.fromJson(response?.data, (json) => json);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }
}
