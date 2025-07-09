abstract class IApiService {
    Future<bool> processTransfer({required String account, required double amount});
}
