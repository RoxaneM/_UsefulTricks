//___FILEHEADER___

import Foundation

protocol ___VARIABLE_moduleName___PresenterProtocol: BasePresenterProtocol {
    
}

final class ___VARIABLE_moduleName___Presenter: BasePresenter, ___VARIABLE_moduleName___PresenterProtocol {
    private var view: ___VARIABLE_moduleName___ViewProtocol? {
        return _view as? ___VARIABLE_moduleName___ViewProtocol
    }
    
    private var router: ___VARIABLE_moduleName___RouterProtocol? {
        return _router as? ___VARIABLE_moduleName___RouterProtocol
    }
}
