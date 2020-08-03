package com.islery.whooooo.ui.vote.detail

import android.content.res.Resources
import android.graphics.drawable.Drawable
import android.os.Build
import android.os.Bundle
import android.util.TypedValue
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.core.content.res.ResourcesCompat
import com.bumptech.glide.Glide
import com.google.firebase.database.ktx.database
import com.google.firebase.ktx.Firebase
import com.islery.whooooo.R
import com.islery.whooooo.data.model.*
import com.islery.whooooo.databinding.FragmentVoteDetailBinding
import com.islery.whooooo.ui.list.VOTE_KEY
import moxy.MvpAppCompatFragment
import moxy.ktx.moxyPresenter

class VoteDetailFragment : MvpAppCompatFragment(), VoteDetailView {

    private var _binding: FragmentVoteDetailBinding? = null
    private val binding get() = _binding!!

    private var imageUrlOne: String? = null
    private var imageUrlTwo: String? = null
    private var voteId: String? = null
    private var voteName: String? = null

    private val presenter by moxyPresenter { VoteDetailPresenter() }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (arguments != null) {
            val vote: VoteEvent? = arguments?.getParcelable<VoteEvent>(VOTE_KEY)
            imageUrlOne = vote?.firstItem
            imageUrlTwo = vote?.secondItem
            voteId = vote?.identifier
            voteName = vote?.name
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

        setVoteName()
        imageUrlOne?.let { presenter.showImage(binding.imageOne, it) }
        imageUrlTwo?.let { presenter.showImage(binding.imageTwo, it) }

        binding.imageOne.setOnClickListener {
            setBackgroundIfFirst()
            voteId?.let { voteId -> presenter.voteForFirstItem(voteId) }
        }

        binding.imageTwo.setOnClickListener {
            setBackgroundIfSecond()
            voteId?.let { voteId -> presenter.voteForSecondItem(voteId) }
        }
    }


    override fun onDestroy() {
        super.onDestroy()
        _binding = null
    }

    override fun setVoteName() {
        binding.voteName.text = voteName
    }

    override fun setBackgroundIfFirst() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            binding.root.background =
                resources.getDrawable(R.drawable.background_gradient_top, null)
        }
    }

    override fun setBackgroundIfSecond() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            binding.root.background =
                resources.getDrawable(R.drawable.background_gradient_bottom, null)
        }
    }


}
