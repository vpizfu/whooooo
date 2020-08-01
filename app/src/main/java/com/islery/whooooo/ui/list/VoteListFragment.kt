package com.islery.whooooo.ui.list

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.core.view.isVisible
import androidx.recyclerview.widget.LinearLayoutManager
import com.islery.whooooo.data.model.VoteEvent
import com.islery.whooooo.databinding.FragmentVoteListBinding
import kotlinx.android.synthetic.main.fragment_vote_list.*
import moxy.MvpAppCompatFragment
import moxy.ktx.moxyPresenter

class VoteListFragment : MvpAppCompatFragment(), VoteListView {

    private var _binding: FragmentVoteListBinding? = null
    private val binding get() = _binding!!

    private val presenter by moxyPresenter { VoteListPresenter() }
    private val adapter = VoteListAdapter { presenter.showVoteDetails(it) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        presenter.getData()
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        _binding = FragmentVoteListBinding.inflate(inflater, container, false)
        initRv()
        return binding.root
    }

    private fun initRv() {
        binding.list.layoutManager = LinearLayoutManager(requireContext())
        binding.list.adapter = adapter
    }

    override fun onDestroy() {
        super.onDestroy()
        _binding = null
    }

    override fun setData(list: List<VoteEvent>) {
        adapter.submitList(list)
    }

    override fun showNextView(vote: VoteEvent) {
        Toast.makeText(requireContext(), "Next view ${vote.name}", Toast.LENGTH_SHORT).show()
    }

    override fun showError() {
        TODO("Not yet implemented")
    }

    override fun showProgress() {
        progressBar.isVisible = true
    }

    override fun hideProgress() {
        progressBar.isVisible = false
    }

}