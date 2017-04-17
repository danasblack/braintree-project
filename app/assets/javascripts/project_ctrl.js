
(function() {
	angular.module('braintree-web').controller('projectCtrl', function($scope){
		$scope.client = new braintree.api.Client({
			clientToken: '<%= @client_token %>'
			client.tokenizeCard({
				number: '#card-number',
				expirationDate: 'expiration-date'
			}, function (err, nonce) {
  // Send nonce to your server
          });
		});
	});
}
)



