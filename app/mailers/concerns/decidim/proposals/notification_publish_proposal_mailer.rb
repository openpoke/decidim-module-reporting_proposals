# frozen_string_literal: true

module Decidim
  module Proposals
    class NotificationPublishProposalMailer < Decidim::ApplicationMailer
      include Decidim::TranslationsHelper
      include Decidim::SanitizeHelper

      helper Decidim::ResourceHelper
      helper Decidim::TranslationsHelper

      def notify_proposal_author(proposal, recipient)
        @proposal = proposal
        @organization = proposal.organization
        @recipient = recipient

        with_user(recipient) do
          mail(to: recipient.email, subject: t("subject", scope: "decidim.reporting_proposals.notification_publish_proposal_mailer.notify_proposal_author"))
        end
      end
    end
  end
end
