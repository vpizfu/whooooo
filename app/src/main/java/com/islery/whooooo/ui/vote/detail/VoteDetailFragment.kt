package com.islery.whooooo.ui.vote.detail

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import com.bumptech.glide.Glide
import com.google.firebase.database.ktx.database
import com.google.firebase.ktx.Firebase
import com.islery.whooooo.data.model.VoteEvent
import com.islery.whooooo.databinding.FragmentVoteDetailBinding
import com.islery.whooooo.ui.list.VOTE_KEY
import com.islery.whooooo.ui.list.VoteListFragment
import kotlinx.android.synthetic.main.vote_row.*
import moxy.MvpAppCompatFragment
import moxy.ktx.moxyPresenter

class VoteDetailFragment : MvpAppCompatFragment(), VoteDetailView {

    private var _binding: FragmentVoteDetailBinding? = null
    private val binding get() = _binding!!

    private var imageUrlOne: String? = null
    private var imageUrlTwo: String? = null

    private val presenter by moxyPresenter { VoteDetailPresenter() }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (arguments != null) {
            val vote: VoteEvent? = arguments?.getParcelable<VoteEvent>(VOTE_KEY)
            imageUrlOne = vote?.one
            imageUrlTwo = vote?.two
        }
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        _binding = FragmentVoteDetailBinding.inflate(inflater, container, false)
        return binding.root
    }


    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        Glide.with(binding.imageOne)
            .load(imageUrlOne)
            .centerCrop()
            .into(binding.imageOne)

        Glide.with(binding.imageTwo)
            .load(imageUrlTwo)
            .centerCrop()
            .into(binding.imageTwo)

        val database = Firebase.database.getReference("votesCount")
    }

    override fun onDestroy() {
        super.onDestroy()
        _binding = null
    }


}