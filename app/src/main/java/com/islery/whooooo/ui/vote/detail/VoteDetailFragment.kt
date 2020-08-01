package com.islery.whooooo.ui.vote.detail

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.islery.whooooo.databinding.FragmentVoteDetailBinding
import moxy.MvpAppCompatFragment
import moxy.ktx.moxyPresenter

class VoteDetailFragment: MvpAppCompatFragment(), VoteDetailView {

    private var _binding: FragmentVoteDetailBinding? = null
    private val binding get() = _binding!!

    private val presenter by moxyPresenter { VoteDetailPresenter() }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        _binding = FragmentVoteDetailBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onDestroy() {
        super.onDestroy()
        _binding = null
    }
}