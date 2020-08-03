package com.islery.whooooo.ui.login

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.navigation.fragment.findNavController
import com.islery.whooooo.R
import com.islery.whooooo.databinding.FragmentLoginBinding
import moxy.MvpAppCompatFragment
import moxy.ktx.moxyPresenter


class LoginFragment : MvpAppCompatFragment(), LoginView {

    private var _binding: FragmentLoginBinding? = null
    private val binding get() = _binding!!

    private val presenter: LoginPresenter by moxyPresenter { LoginPresenter() }


    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        _binding = FragmentLoginBinding.inflate(inflater, container, false)
        binding.loginBtn.setOnClickListener {
            presenter.performLogin(
                binding.inputEmail.text.toString().trim(),
                binding.inputPass.text.toString().trim()
            )
        }
        binding.toRegBtn.setOnClickListener {
            presenter.toRegistration()
        }
        binding.toResetPassBtn.setOnClickListener { presenter.toPasswordRecovery() }
        return binding.root
    }

    override fun onDestroy() {
        super.onDestroy()
        _binding = null
    }

    override fun onLoginSuccess() {
       findNavController().navigate(R.id.action_global_voteListFragment)
    }

    override fun proceedToRegistration() {
        findNavController().navigate(R.id.action_loginFragment_to_registerFragment)
    }

    override fun onLoginError(error: String) {
        Toast.makeText(requireContext(), "error", Toast.LENGTH_SHORT).show()
    }

    override fun onEmailError(error: String?) {
        binding.inputEmailLayout.error = error
    }

    override fun onPassError(error: String?) {
        binding.inputPassLayout.error = error
    }

    override fun proceedToRecovery() {
        findNavController().navigate(R.id.action_loginFragment_to_resetPassFragment)
    }

}