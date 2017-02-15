# Client and Provider Pattern Oauth2
The projects attached in the repository use the OAuth 2.0 protocol for application authentication.

The provider project is responsible for managing tokens. Example: the token creation process starts after a request via rest from the client application to the provider, in this request a list of permissions is sent to be approved by the user.
After the permissions are granted, a new token with expiration date is generated and sent to the client via rest.

The client project performs the expired token creation, validation, and renewal procedures. With a valid token the system performs the search of user information stored in the provider.
 
## Motivation
These projects were created for the purpose of learning and dissemination as an example in projects that intend to use this protocol.

## Installation

### For generate build of the WAR:
   __mvn clean install__


### Develop in eclipse:
   __mvn clean install eclipse:eclipse__

Any doubts, please, call me.

## Lincense
Permission is hereby granted, free of charge, to any person obtaining a copy of this project and associated documentation files (the "Project"), to deal in the Project without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE PROJECT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE PROJECT OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
