# -*- coding: utf-8 -*-

from flask import request, jsonify, Blueprint
from flask_jwt_extended import (
    create_access_token,
    create_refresh_token,
    jwt_refresh_token_required,
    get_jwt_identity
)

from smoke_backend.models import User
from smoke_backend.extensions import pwd_context, jwt


blueprint = Blueprint('auth', __name__, url_prefix='/auth')

'''Login - if user name or password wasn't entered, then error
if user name or password wasn't correct, the error
returns success!
'''
@blueprint.route('/login', methods=['POST'])
def login():
    """Authenticate user and return token
    """
    if not request.is_json:
        return jsonify({"msg": "Missing JSON in request"}), 400

    username = request.json.get('username', None)
    password = request.json.get('password', None)
    if not username or not password:
        return jsonify({"msg": "Missing username or password"}), 400

    user = User.query.filter_by(username=username).first()
    if user is None or not pwd_context.verify(password, user.password):
        return jsonify({"msg": "Bad credentials"}), 400

    access_token = create_access_token(identity=user.id)
    refresh_token = create_refresh_token(identity=user.id)

    ret = {
        'access_token': access_token,
        'refresh_token': refresh_token
    }
    return jsonify(ret), 200

'''Don't know what this does
I assumme it is adding current user to something?
'''
@blueprint.route('/refresh', methods=['POST'])
@jwt_refresh_token_required
def refresh():
    current_user = get_jwt_identity()
    ret = {
        'access_token': create_access_token(identity=current_user)
    }
    return jsonify(ret), 200

'''Returns user information
'''
@jwt.user_loader_callback_loader
def user_loader_callback(identity):
    return User.query.get(identity)
