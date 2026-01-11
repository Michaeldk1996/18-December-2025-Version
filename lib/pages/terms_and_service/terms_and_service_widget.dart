import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'terms_and_service_model.dart';
export 'terms_and_service_model.dart';

class TermsAndServiceWidget extends StatefulWidget {
  const TermsAndServiceWidget({super.key});

  static String routeName = 'termsAndService';
  static String routePath = '/termsAndService';

  @override
  State<TermsAndServiceWidget> createState() => _TermsAndServiceWidgetState();
}

class _TermsAndServiceWidgetState extends State<TermsAndServiceWidget> {
  late TermsAndServiceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsAndServiceModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'termsAndService'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.arrow_back,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'TERMS_AND_SERVICE_arrow_back_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.safePop();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    '''Terms And Conditions
                    
ARTICLE 1 – DEFINITIONS AND SCOPE OF APPLICATION OF THE GENERAL TERMS AND CONDITIONS

1.1. In these General Terms and Conditions the undergoing terms are defined as follows:
Content
Any type of content or material that is uploaded to or posted on the Platform by The Company, including images, videos, text elements, audio elements, GIFs/memes and any other type of content or material in whatever way or form.
Customer
Any natural person purchasing a subscription for purposes that are outside their business, craft or profession.
Data Subject
Any natural person whose personal data is collected, held or processed by The Company
The Company
The Company is a private LLP company located in Kinburn Street 32, London SE16 6DW
General Conditions
These General Terms and Conditions
Intellectual Property Rights
All of the following legal rights, title, or interest in or arising under the laws of UK, any state, any other country or international treaty regime, whether or not filed, perfected, registered or recorded and whether now or hereafter existing, filed, issued or acquired, including all renewals thereof: (i) patents, patent applications and patent rights, including any such rights granted upon any reissue, re-examination, division, extension, provisional, continuation or continuation-in-part applications, and equivalent or similar rights anywhere in the world in inventions and discoveries; (ii) rights associated with works of authorship and literary property rights, including, but not limited to, copyrights, copyright applications and copyright registrations, and moral rights; (iii) rights relating to know-how or trade secrets, including but not limited to ideas, concepts, methods, techniques, inventions and other works, whether or not developed or reduced to practice, rights in industrial property, customer, vendor and prospect lists, and all associated information or databases, and other confidential or proprietary information; (iv) industrial designs, industrial models, utility models, certificates of invention and other indicia of invention ownership; (v) trademarks, service marks, logos, trade dress, Internet addresses (URLs), trade names and service names, whether or not registered, and the goodwill associated therewith; and (vi) any rights related to data bases (v) any rights on software (vii) any rights analogous to those set forth in the preceding language and any other proprietary rights relating to intangible property anywhere in the world.
Platform
BSP Consult, which is a secure online area, consultable via www.bspconsult.com, to which the Customer obtains access after purchasing a Subscription or Program, on which The Company shares personal insights and educational content related to the sports prediction and analysis space, and more specifically its own analyses of the Tennis sport.
Subscription
The access to the Platform gained by Customers by purchasing a subscription, also referred to as a membership or a program, whereby they have the choice between different programs. The duration of access to the Platform depends on the chosen subscription, membership or program, as set out in article 4.1.

1.2. These General Conditions apply to proposals, offers and/or invoices issued by The Company, as well as to all agreements concluded between The Company and the Customer in the context of the Platform. Any deviations from these General Conditions are only opposable to The Company subject to the explicit, prior and written acceptance by The Company.

1.3. If a Customer purchases a Subscription, membership or program granting access to the Platform of The Company, this means that the Customer fully and unreservedly agrees to these General Conditions.
ARTICLE 2 – NATURE OF THE SERVICES

2.1. The Platform consists of several distinct parts.
One part of the Platform provides Customers with access to Content consisting of analyses and evaluations of sports events, which are created and shared by The Company.
Another part of the Platform provides Customers with access to educational and informational Content, including video materials and interactive communications, through which The Company shares its own insights, methodologies and perspectives related to sports betting and sports analysis. Such Content may also be made available through instant messaging technologies or other digital communication tools, through which different types of sports-related and betting-related information selected by The Company are shared.

2.2. The Company provides informational and educational content relating to tennis analysis and sports prediction methodologies. The Company does not provide financial, investment, legal, or tax advice, and does not operate as a regulated gambling operator, bookmaker, or gambling intermediary. Any Content provided through the Platform shall not be construed as financial, investment or gambling advice. Customers remain solely responsible for ensuring that their use of the Platform complies with applicable laws and regulations in their jurisdiction.

2.3. Responsible Use: The Platform is intended for informational and educational purposes only. The Company does not encourage unlawful gambling and does not target vulnerable persons. Customers acknowledge that sports betting involves risk and should be approached responsibly. The Customer remains solely responsible for complying with local gambling laws, restrictions, self-exclusion rules, and any applicable regulatory requirements in their jurisdiction.
ARTICLE 3 – FORMATION AND ELEMENTS OF THE CONTRACT

3.1. All proposals and/or offers made by The Company are binding. Subscriptions, programs or memberships are valid for one year from the date of purchase. Certain subscriptions or memberships, including but not limited to the Silver subscription, will automatically renew annually unless canceled in accordance with the cancellation policy, which can be found under ‘ARTICLE 9 – CANCELLATION POLICY & SUBSCRIPTION RENEWAL’.

3.2. In order to purchase a Subscription, membership or program and make use of the Platform, the Customer must be eighteen (18) years of age or older. By registering for the services of The Company, the Customer declares and warrants that he/she/x is at least eighteen (18) years old. The Company cannot be held liable if the Customer turns out not to be of legal age.
If the laws of the country, state or province in which the Customer resides require a higher minimum age, the Customer acknowledges and agrees that he/she/x must meet such higher minimum age requirement in order to create an account, purchase a Subscription, membership or program, and make use of the Platform. The Company may request additional age or identity verification at any time.
Furthermore, Customers who reside in jurisdictions where sports betting or related activities are prohibited or restricted by law are not permitted to purchase a Subscription, membership or program, or to access or use the Platform. The Customer is solely responsible for ensuring that access to and use of the Platform is lawful in their jurisdiction. The Company cannot be held liable if a Customer accesses the Platform or purchases a Subscription, membership or program in violation of applicable local laws or regulations.
The Company reserves the right to restrict, block or deny access to the Platform and/or its website or application from certain countries or jurisdictions where sports betting or related activities are illegal or restricted, and shall not be liable for any consequences arising from such restrictions or blocking.
To enforce these restrictions, The Company takes active measures to prevent access from such jurisdictions, including but not limited to geo-blocking its website and online services through Cloudflare and restricting the distribution and availability of its mobile application on iOS and Android platforms in countries where sports betting or related activities are prohibited or restricted. The Company shall not be held liable for any inability of Customers to access the Platform as a result of such technical or legal restrictions.

3.3. To purchase a Subscription, program or membership and thus place an order, the Customer must follow the ordering process as set out on the website of the Platform under [https://bspconsult.com]. The Customer must fill in his/her/x customer details and choose a payment method, whereby the Customer may use a promotional code if available. In the next step, an overview of the desired order is displayed in detail. It is the Customer’s responsibility to verify the order and, if necessary, to correct any input errors before placing the final order.
The Company hereby reserves the right to request any additional information if necessary.
By completing the ordering process, the Customer places a binding order for the Subscription, program or membership and undertakes to pay the applicable fees. After the Customer has placed the order, The Company will immediately confirm the order to the Customer by e-mail.

3.4. By purchasing a Subscription, membership or program via the website of The Company, the Customer expressly agrees that access to the Platform is provided immediately after completion of the purchase process as described in Article 3.3, and that the service shall commence without delay.
For Subscriptions, memberships or programs that include sports betting models or similar proprietary digital content, the Customer acknowledges and agrees that such models are delivered manually by The Company, which may require additional processing time. The Company shall make reasonable efforts to deliver such content within a maximum period of twenty-four (24) hours from the completion of the purchase. This delivery timeframe shall not constitute a delay in service provision and may not be invoked as a ground for cancellation, withdrawal or refund.
Pursuant to Article 16(m) of the EU Consumer Rights Directive (2011/83/EU) and the UK Consumer Contracts Regulations (2013), the right of withdrawal does not apply to digital content or services that are provided immediately after purchase. By completing the purchase, the Customer expressly acknowledges and agrees that the service begins immediately and waives any right of withdrawal or cancellation once the service has commenced, including in cases where additional digital content is delivered manually within the agreed timeframe.
ARTICLE 4 – PRICE AND PAYMENT

4.1. The price of a Subscription, membership or program depends on the program selected by the Customer. The Company offers the following programs:
SILVER PROGRAM: This program grants the Customer access to specific parts of the Platform that include sports-related analyses and informational Content created and shared by The Company for a period of twelve (12) months, starting from the completion of the subscription order process.This program automatically renews annually from the date of purchase unless canceled in accordance with Article 9.
It is expressly understood that this program is linked to the ATP Tennis Calendar season, as published annually on the ATP website. Consequently, the Customer acknowledges that during the months of November and December, the number of scheduled events may be significantly reduced or nonexistent. As a result, analyses, predictions or other related Content may be limited or unavailable during these periods.November and December form part of the subscription term, and the reduced or absent availability of Content during these months shall not constitute grounds for extension, renewal, refund or compensation, unless explicitly communicated otherwise by The Company.
ADVANCED PROGRAM: This program grants the Customer access to a broader range of parts of the Platform than the Silver Program, including additional analyses, educational Content and tools made available by The Company, for a period of twelve (12) months from the completion of the ordering process. Unless expressly stated otherwise at the time of purchase, this program does not automatically renew and access will terminate at the end of the subscription period unless renewed by the Customer. This program is also linked to the ATP Tennis Calendar season, and the same limitations regarding the months of November and December apply as described above.
GOLD PROGRAM: This program grants the Customer access to all available parts of the Platform, including advanced analyses, educational Content, video materials and interactive communications shared by The Company, for a period of twelve (12) months from the completion of the ordering process. Unless expressly stated otherwise at the time of purchase, this program does not automatically renew and access will terminate at the end of the subscription period unless renewed by the Customer.
This program is intrinsically linked to the ATP Tennis Calendar season. The Customer acknowledges that during the months of November and December, the number of scheduled events may be significantly reduced or nonexistent, and that analyses or predictions may therefore be limited or unavailable. November and December remain integral parts of the subscription term and shall not justify any extension, renewal or compensation.
SPORTS BETTING MODELS PROGRAM: This program provides access to two distinct sports betting models, which consist of data and proprietary intellectual property.

4.2. The price for each subscription program is as stated on the website of the platform at the time of purchase. The listed prices are the total amount due for payment.

4.3. The Company reserves the right to change the subscription prices at any time. Unless otherwise specified by the Company, any price change will not affect ongoing subscriptions at the time of the change.

4.4. Payment for the subscription must be made at the time of placing the order on the platform’s website.

4.5. As outlined in the cancellation policy, any sports betting models made available by The Company constitute proprietary intellectual property of The Company. No sale, transfer of ownership or assignment of intellectual property rights takes place. Customers are granted only a limited, personal, non-exclusive and non-transferable right to access and use a copy of such models, strictly for the duration of an active Subscription, membership or program.
Due to the proprietary nature of the models and the immediate access granted upon purchase, all Subscriptions, memberships and programs that include access to such models are non-refundable, as specified in Article 9. Upon expiration or non-renewal of the Subscription, membership or program, the Customer’s right to access and use the models shall automatically terminate.

Access Termination and Proprietary Models: For any program that includes access to The Company’s proprietary BSP Tennis betting models, the Customer expressly acknowledges that such models remain the exclusive intellectual property of The Company. The Customer is granted only a limited, non-transferable and non-perpetual right to use a copy of the models, which is valid solely for the duration of an active Subscription, membership or program.
If the Customer chooses not to renew their Subscription, membership or program, access to the Platform and to the BSP Tennis betting models shall immediately terminate, and the Customer shall no longer be entitled to use, access or rely on such models in any form.
ARTICLE 5 – OBLIGATIONS OF THE COMPANY

5.1. Once the Customer has purchased a Subscription, membership or program and The Company has received the applicable payment, The Company shall create an account for the Customer and grant access to the Platform in accordance with the terms of the selected Subscription, membership or program.

5.2. The Company shall make reasonable efforts to upload and make available new Content on the Platform on a regular basis, depending on market conditions and available opportunities. While The Company prioritizes quality over quantity, there may be periods during which there are limited or no relevant events, data or information to share. In such cases, Content may not be provided on certain days or during certain periods.
 In addition, The Company may provide do-it-yourself (DIY) tools and resources, which form part of the services and are made available for Customer use.

5.3. Any delay, reduction or temporary absence of Content resulting from market conditions, unforeseen circumstances, technical issues or other factors beyond the reasonable control of The Company shall not entitle the Customer to any compensation, refund or termination of the Subscription, membership or program.
ARTICLE 6 – USE OF THE PLATFORM

6.1. The Customer shall use the Platform in good faith and in accordance with these General Conditions. In order to access and use the Platform, Customers may be required to have certain compatible hardware and software (which may be subject to fees charged by third parties), which remain the sole responsibility of the Customer. Periodic updates may also be required. The Customer acknowledges that the use of the Platform may be affected by the functioning of such elements, which are not under the control of The Company.

6.2. The Customer shall refrain from:
 • attempting to manipulate the Platform by inserting computer viruses, malicious code or any other harmful software;
 • using any robot, spider, screen or database scraper, site research or retrieval application, or any other automated device, process or means to access or retrieve any portion of the Content or information on the Platform;
 • attempting to circumvent, bypass or evade any technical, legal or territorial restrictions implemented by The Company, including but not limited to the use of VPNs, proxy servers or similar technologies;
 • using the Platform for any purpose that cannot reasonably be considered acceptable in light of the services provided and the intentions of The Company.

6.3. The account used by the Customer to access the Platform is strictly personal and may only be used by the Customer. It is strictly prohibited to share login credentials, provide access to third parties, or use the username or password of another person.

6.4. Any breach of these General Conditions may result in the immediate suspension or termination of the Subscription, membership or program, without the Customer being entitled to any compensation, subject to applicable mandatory law. The Company reserves the right to seek compensation for any direct or indirect damages suffered as a result of such breach.
If it is determined that access to the Platform has been shared with third parties for economic or commercial gain, the Customer shall be subject to a contractual fine of €10,000, without prejudice to The Company’s right to claim additional damages where applicable.

6.5. Third-Party Platforms: Where any Content, communications, access links or services are delivered or supported through third-party providers (including hosting providers, cloud platforms, messaging applications or video platforms), The Company shall not be liable for interruptions, delays, restrictions, bans, removals, technical failures or changes imposed by such third parties.
ARTICLE 7 – COMPLAINTS

7.1. Complaints concerning the Platform, the Content or the services delivered by The Company should be made as soon as possible and should be addressed to management@bspconsult.com. The Company shall inform the Customer as soon as possible, and at the latest within fourteen (14) days after receipt of the complaint, by e-mail or other written means.
ARTICLE 8 – FORCE MAJEUR

8.1. The Company shall not be liable and not be bound to fulfil any obligation towards its Customer in case of force majeure.

8.2. Force majeure is understood to mean: any unforeseeable event beyond the reasonable control of the parties or any foreseeable event the consequences of which cannot reasonably be avoided, which wholly or partly prevents, delays, or substantially complicates the execution of the agreement. This includes, but is not limited to: fire, flood, war, embargo, riots, the actions of any governmental authorities, administrative measures, hacking, contractual failures by third parties, errors or delays attributable to third parties, sudden illness and network/internet/telecom failures.

8.3. In the event of force majeure, the obligations of The Company shall be suspended. In such a case, The Company will make all reasonable efforts to limit the consequences of the force majeure situation.

8.4. In the event that the Platform is not accessible for a period exceeding one (1) week due to demonstrable force majeure, the Customer is entitled to an extension of their subscription for the period during which the Platform was not accessible. Demonstrable force majeure never leads to a refund of paid Subscriptions.

8.5. If the force majeure lasts longer than one (1) month, the Customer shall be entitled to unsubscribe without court intervention and without The Company being liable to refund or pay any compensation to the Customer.
ARTICLE 9 – CANCELLATION POLICY & SUBSCRIPTION RENEWAL

9.1. Refund Policy for Initial Subscription, Membership or Program: When purchasing a Subscription, membership or program for the first time, the Customer acknowledges that it is non-refundable once access to proprietary sports betting models or similar digital content is granted, whether such access is provided immediately or delivered manually.
Any sports betting models made available by The Company constitute proprietary intellectual property. No sale, transfer of ownership or assignment of intellectual property rights takes place. The Customer is granted only a limited, personal, non-exclusive, non-transferable and time-limited license to access and use a copy of such models, strictly for the duration of an active Subscription, membership or program.
Where applicable, delivery of such models is facilitated through Google Drive or similar secure digital tools, where access is granted to the licensed email address of the Customer. The Company may rely on access logs, copy records and licensing data (including the list of licensed email addresses) as proof that the models have been delivered and accessed by the Customer. Once access has been granted, the Subscription, membership or program shall be considered fully performed for refund purposes and therefore non-refundable, in accordance with Article 16(m) of the EU Consumer Rights Directive (2011/83/EU) and the UK Consumer Contracts Regulations (2013).

9.2. Automatic Renewal: Certain Subscriptions, memberships or programs, including but not limited to the Silver Program, are valid for one (1) year and automatically renew annually on the anniversary of the original purchase date, unless canceled by the Customer prior to the renewal date in accordance with this Article.
Other Subscriptions, memberships or programs may not automatically renew, as clearly indicated at the time of purchase.

9.3. Non-Refundable Policy for Renewals All Subscriptions, memberships or programs are non-refundable once renewed. Upon renewal, the Customer immediately regains access to the Platform and, where applicable, to proprietary digital content and licensed models. As the service is provided immediately upon renewal, no refunds shall be granted after the renewal date, subject to applicable mandatory law.

9.4. Cancellation Before Renewal: Customers may cancel an automatically renewing Subscription, membership or program at any time prior to the renewal date in order to avoid charges for the subsequent subscription period. Cancellation may only be effected by written notice sent by the Customer to management@bspconsult.com prior to the renewal date. Cancellation shall be deemed effective on the date and time the cancellation email is received by The Company’s email server, provided that the Customer includes sufficient identifying information (including the account email address used for purchase). The Company may provide confirmation of receipt, however the absence of confirmation shall not invalidate a valid cancellation received in time.

9.5. Intellectual Property, Licensing and Unauthorized Use: a. All Content, including but not limited to sports betting models, data, analyses, methodologies and related materials made available through the Platform, remains the exclusive intellectual property of The Company.
b. Each proprietary model provided by The Company is licensed to a specific Customer and linked to one or more licensed email addresses. This licensing system enables The Company to monitor and verify whether models have been accessed, shared, copied or made available to third parties without authorization.
c. Copying, reproducing, distributing, sublicensing, reselling, sharing or making available the models or any part thereof to third parties is strictly prohibited, whether free of charge or for economic or commercial gain.
d. If the Customer is found to have shared, copied, distributed or otherwise misused the licensed models or Content, including by granting access to an unlicensed email address or third party, the Customer shall be subject to a contractual fine of €10,000 per violation, without prejudice to The Company’s right to claim additional damages where the actual harm suffered exceeds this amount.
e. If the unauthorized use continues after notification, an additional contractual penalty of €500 per day shall apply starting from the second week of the violation until the infringement has fully ceased.

9.6. Enforcement of Terms: The Company reserves the right to suspend or terminate access to the Platform immediately in the event of suspected or confirmed misuse, and to pursue legal action to enforce these terms, including the recovery of fines, damages, legal costs and any other losses arising from unauthorized use or distribution of its intellectual property.

9.7. Chargebacks and Payment Disputes: If a Customer initiates a chargeback, reversal or payment dispute without valid legal grounds, The Company reserves the right to immediately suspend access to the Platform pending investigation. This does not affect The Company’s right to recover outstanding fees, chargeback costs, administrative costs and any damages permitted by law.
ARTICLE 10 – TERMINATION

10.1. The Customer has the right to terminate his/her/x Subscription, membership or program in the event of gross negligence or willful misconduct on the part of The Company. In such case, the Customer must notify The Company of the termination and the reasons therefore in writing within fourteen (14) days following the discovery of such gross negligence. Such notification must be sent by post to the following address: Kinburn Street 32, London SE16, or by email to management@bspconsult.com. Failure to comply with this notification requirement may result in the termination request being deemed inadmissible.

10.2. The Customer expressly acknowledges that the analyses, insights and informational content provided by The Company, including any content that may be used in connection with sports betting activities, are provided for informational and educational purposes only and shall not be construed as financial, investment or gambling advice.
The sports betting market is inherently subject to variance, randomness and unexpected results, including factors beyond the control of The Company such as player performance, injuries, weather conditions, officiating decisions and other unforeseeable circumstances. Accordingly, unsuccessful results, losses or deviations from expected outcomes shall not constitute grounds for reimbursement, compensation, termination or refund of any Subscription, membership or program. The Customer accepts full responsibility for any decisions made based on the Content provided and acknowledges that all use of such information is at the Customer’s own risk.

10.3. Except where mandatory law provides otherwise, the Customer may terminate an automatically renewing Subscription, membership or program only in accordance with the cancellation procedure set out in Article 9, and within the applicable notice period prior to renewal. Termination does not give rise to any right to compensation or refund for the ongoing subscription period.

10.4. The Company is entitled to terminate or suspend a Customer’s Subscription, membership or program at any time, with immediate effect, without judicial authorization, without prior notice of default and without payment of any compensation, in the following cases:
(i) if the Customer, despite written notice of default granting a period of at least seven (7) calendar days, remains in breach of one or more obligations arising from these General Conditions; or
(ii) if The Company has reasonable grounds to believe that the Customer will not fulfil his/her/x obligations towards The Company; or
(iii) in the event of misuse, unauthorized sharing, copying or infringement of The Company’s intellectual property.
In such cases, all outstanding amounts owed by the Customer shall become immediately due and payable, without prejudice to The Company’s right to claim damages, contractual fines, costs and interest.
If The Company decides to terminate a Subscription, membership or program, it shall notify the Customer by email, stating the reasons for the decision. The Customer may submit a written request for review of the decision by contacting management@bspconsult.com. The Company shall not be liable for any loss suffered as a result of suspension, termination or the investigation of such request.

10.5. The Subscription, membership or program shall be terminated by operation of law:
• in the event of the death of the Customer;
• if The Company permanently ceases to operate, discontinues the Platform, or takes the Platform offline.
In the event that The Company permanently ceases its activities, Customers holding an active yearly Subscription, membership or program shall be entitled to a pro rata reimbursement corresponding to the unused portion of the subscription period, calculated from the effective date of cessation until the original end date of the Subscription, membership or program.
One-time fee Subscriptions, memberships or programs, including but not limited to programs involving one-off access, proprietary models or non-recurring digital content, shall not be eligible for any reimbursement in the event of cessation of The Company’s activities.
ARTICLE 11 – INTELLECTUAL PROPERTY

11.1. The Company and/or its licensors are the exclusive owner(s) or authorized beneficiary(ies) of all Intellectual Property Rights relating to the Platform, the services provided by The Company, and all Content made available therein. This includes, without limitation, all texts, analyses, models, databases, methodologies, software, documentation, graphics, videos, tools, and other materials, whether registered or unregistered.

11.2. The sports betting models provided by The Company, including those delivered in the form of Google Spreadsheets or similar digital formats, are original works created by or on behalf of The Company. These models are based on The Company’s expertise, experience, data selection, structure, methodologies and analytical choices, and constitute confidential and proprietary materials.

11.3. The Customer expressly acknowledges that the sports betting models and related materials are protected under applicable laws by one or more of the following, independently of any formal registration:
•copyright protection arising automatically upon creation;
•database rights (where applicable);
•trade secret and confidential information protections;
•contractual protections arising from these General Conditions.

11.4. No sale, transfer or assignment of Intellectual Property Rights takes place. The Customer is granted only a limited, personal, non-exclusive, non-transferable and revocable license to access and use the Content and models strictly for personal use and solely for the duration of an active Subscription, membership or program.

11.5. The Customer shall fully and unconditionally respect all Intellectual Property Rights associated with the Platform and the services of The Company. The Customer expressly agrees that the Content and models may not be copied, reproduced, extracted, adapted, redistributed, transmitted, sublicensed, resold, recorded, made available to third parties or otherwise exploited, whether in whole or in part, in any form or by any means.

11.6. Without prejudice to mandatory rights relating to the protection of computer programs, the Customer shall not:
•modify, translate, reverse engineer or adapt any part of the Platform or its components;
•decompile or disassemble any software or technical element associated with the Platform;
•copy or store Content or models beyond what is strictly necessary for permitted use;
•transfer, sublicense, lease, lend or distribute any Content, model or documentation to third parties;
•create derivative works based on the Platform, models or Content;
•use the Platform, models or confidential information to create competing, equivalent or substitute products or services;
•remove, obscure or alter any proprietary notices, copyright notices or identifiers.

11.7. Nothing contained on the Platform shall be construed as granting any right or license to make commercial use of any trademark, trade name, Intellectual Property Right or copyrighted material of The Company or its licensors without prior written consent.

11.8. In the event of any violation of this Article 11, the Customer shall forfeit to The Company an immediately payable contractual fine of €10,000 per violation, without prejudice to The Company’s right to claim additional damages where the actual harm suffered exceeds this amount. If the infringement continues after notification, an additional penalty of €500 per day shall apply starting from the second week of the violation until the infringement has fully ceased.

11.9. Evidence and Monitoring: The Customer acknowledges that digital records and technical logs, including but not limited to file metadata, version histories, access logs, licensing records, email delivery records, and cloud sharing logs (including Google Drive “People with access” records), may constitute valid and admissible evidence of ownership, delivery, access, and unauthorized copying, sharing or misuse of Content and models.


ARTICLE 12 – LIABILITY (Corrected & Reinforced Version)

12.1. Except in the event of fraud, willful misconduct or gross negligence, and subject to applicable mandatory law, The Company shall not be liable for any indirect, incidental or consequential damages resulting from the use of the Platform or from the temporary or permanent inability to access or consult the Platform.

12.2. The Content made available on the Platform is provided for informational and educational purposes only. While The Company makes reasonable efforts to ensure that such Content is accurate and up to date, it does not guarantee completeness, accuracy or reliability, and shall not be held liable for any damage arising from incorrect, incomplete or outdated information.

12.3. Any decisions made by the Customer based on the Content available on the Platform are made at the Customer’s sole risk. The Company shall not be liable, in any manner whatsoever, for the consequences of such decisions, including financial losses or missed opportunities.

12.4. The Customer acknowledges that the Platform may become temporarily unavailable due to various causes, including but not limited to software failures, third-party service disruptions, protocol changes, internet outages, force majeure events or scheduled or unscheduled maintenance. The Company shall not be liable for any damages, whether direct or indirect, resulting from such unavailability.

12.5. The Company shall not be liable for any damage, loss or interruption caused by:
 (i) computer viruses, spyware, Trojan horses or other malicious software affecting the Customer’s devices;
 (ii) vulnerabilities in email, SMS or authentication services, including phishing or spoofing attacks.

12.6. The Customer represents that he/she/x has independently assessed the advisability of using the Platform and the risks associated therewith. The Customer agrees to maintain any insurance deemed necessary to cover such risks and shall rely solely on such insurance for compensation of any resulting damages.

12.7. The Company reserves the right, at any time and for any reason, and subject to applicable mandatory law, to restrict, suspend, deactivate or terminate access to the Platform, or to modify or discontinue the Platform or any part thereof. The Customer acknowledges and agrees that The Company shall not be liable to the Customer or any third party for any such restriction, suspension, termination, modification or discontinuation. The Customer’s sole remedy in the event of dissatisfaction with the Platform is to discontinue its use.

12.8. Without limiting the foregoing and unless otherwise required by applicable mandatory law, The Company shall under no circumstances be liable for:
 • any indirect, incidental or consequential loss, including but not limited to loss of data, loss of profits, loss of earnings, loss of business opportunities, reputational damage, loss of clientele or claims by third parties, regardless of whether such loss arises in contract, tort (including negligence) or otherwise, even if The Company was advised of the possibility of such loss;
 • any direct loss not caused exclusively by The Company’s own gross negligence or willful misconduct.

12.9. To the maximum extent permitted by applicable mandatory law, the aggregate liability of The Company arising out of or in connection with the use of the Platform, the Content or these General Conditions, shall not exceed the total amount paid by the Customer for the relevant Subscription, membership or program giving rise to the claim, irrespective of the legal basis invoked.

12.10. No Guaranteed Outcomes: The Company does not guarantee any result, performance, profit or success rate from the use of its analyses, insights or methodologies. Variance and unpredictable outcomes are inherent to sports and sports betting, and therefore results cannot be guaranteed.
ARTICLE 13 – DATA PROTECTION (Corrected & Reinforced)

13.1. In the context of the performance of this agreement, The Company collects and processes personal data relating to the Customer. The Company acts as a data controller and undertakes to process such personal data in accordance with applicable data protection legislation, including the General Data Protection Regulation (EU) 2016/679 (GDPR) and applicable UK data protection laws.

13.2. The Company may collect and process the following categories of personal data: name, surname, postal address, telephone and/or mobile phone number, email address, date of birth, gender, payment and billing information (including bank account or payment reference details), and any other data necessary for the provision of the services.
Personal data is processed for the following purposes:
•customer and account management;
•provision and administration of Subscriptions, memberships and programs;
•accounting, billing and financial administration;
•invoice and dispute management;
•legal compliance and enforcement of contractual rights;
•direct marketing communications, where permitted by law and subject to the Customer’s prior consent where required.

13.3. Personal data may be shared, where necessary and proportionate, with:
•subcontractors and processors acting on behalf of The Company (such as hosting providers, payment processors, analytics or communication service providers);
•professional advisers, including legal, accounting and audit firms;
•competent authorities, courts or regulators, where required by law or to protect The Company’s legitimate interests.
Where personal data is transferred outside the UK or European Economic Area, The Company shall ensure that appropriate safeguards are in place in accordance with applicable data protection legislation.

13.4. The Company implements appropriate technical and organisational measures to ensure a level of security appropriate to the risk, in order to protect personal data against accidental or unlawful destruction, loss, alteration, unauthorised disclosure or access.

13.5. Personal data shall be retained only for as long as necessary to fulfil the purposes for which it was collected, to comply with legal or regulatory obligations, or to resolve disputes and enforce agreements.

13.6. Data subjects have the right, subject to the conditions and limitations set out in applicable law, to:

•access their personal data;
•request rectification or erasure of inaccurate or unlawful data;
•request restriction of processing;
•object to processing, including for direct marketing purposes
• request data portability where applicable.
Such rights may be exercised provided that proof of identity is supplied where reasonably required.

13.7. Data subjects may withdraw their consent to the processing of personal data for direct marketing purposes at any time, free of charge, without affecting the lawfulness of processing carried out prior to such withdrawal.

13.8. Any questions, requests or complaints regarding the processing of personal data or the exercise of data subject rights may be addressed to management@bspconsult.com. Data subjects also have the right to lodge a complaint with the competent data protection authority.
ARTICLE 14 – INVALID PROVISIONS (SEVERABILITY)

14.1. The provisions of these General Conditions shall be interpreted in a manner that preserves their validity and enforceability under applicable law. If any provision of these General Conditions is held to be invalid, illegal or unenforceable, in whole or in part, such invalidity, illegality or unenforceability shall not affect the validity or enforceability of the remaining provisions of these General Conditions.
In such event, the parties shall replace the invalid, illegal or unenforceable provision, or the affected part thereof, with a valid and enforceable provision that most closely reflects the original intent and economic purpose of the invalid, illegal or unenforceable provision.
ARTICLE 15 – APPLICABLE LAW AND JURISDICTION

15.1. All proposals, invoices and agreements to which these General Conditions apply shall be governed by and construed in accordance with the laws of England and Wales, without regard to its conflict of law principles.

15.2. Subject to applicable mandatory law, all disputes arising out of or in connection with these General Conditions shall fall within the exclusive jurisdiction of the competent courts of London, England.
ARTICLE 16 – NO WAIVER

16.1. The failure or delay by The Company to enforce any provision of these General Conditions or any additional terms shall not be deemed a waiver of such provision, nor shall it affect The Company’s right to enforce such provision at any later time.
''',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      lineHeight: 1.5,
                      font: GoogleFonts.inter(
                        fontWeight: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.5,
                      fontWeight: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
