package com.islery.whooooo.ui.list

import com.islery.whooooo.data.list.IListRepository
import com.islery.whooooo.data.list.ListRepositoryImpl
import com.islery.whooooo.data.list.QueryResult
import com.islery.whooooo.data.model.VoteEvent
import moxy.MvpPresenter

class VoteListPresenter : MvpPresenter<VoteListView>() {

    private val repo: IListRepository = ListRepositoryImpl()

    fun getData(){
        viewState.showProgress()
        repo.getActiveVotes { onVotesReceived(it) }
    }

    fun showVoteDetails(event: VoteEvent){
        viewState.showNextView(event)
    }

    private fun onVotesReceived(res: QueryResult<List<VoteEvent>, String?>){
        viewState.hideProgress()
        when(res){
            is QueryResult.Success ->   viewState.setData(res.data)
        is QueryResult.Error -> {
            val message: String = res.msg ?: "Something went wrong"
            viewState.showError(message)
        }}

    }
}