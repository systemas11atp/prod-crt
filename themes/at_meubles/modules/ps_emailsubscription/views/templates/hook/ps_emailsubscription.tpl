{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

<div class="block_newsletter block clearfix" id="blockEmailSubscription_{$hookName}">
  <h3 class="title_block" id="block-newsletter-label">{l s='Get Discounts & Offers' d='Shop.Theme.Global'}</h3>
  <div class="block_content">
    <form action="{$urls.current_url}#blockEmailSubscription_{$hookName}" method="post">
      <div class="row">
        <div class="col-xs-12">
            {if $conditions}
              <p class="conditions">{$conditions nofilter}</p>
            {/if}
            {if $msg}
              <p class="alert {if $nw_error}alert-danger{else}alert-success{/if}">
                {$msg}
              </p>
            {/if}
	    {if isset($id_module)}
                {hook h='displayGDPRConsent' id_module=$id_module}
              {/if}
        </div>
        <div class="col-xs-12">
          <button
            class="btn float-xs-right"
            name="email"
            type="email"
            value="{l s='Subscribe' d='Shop.Theme.Actions'}"
          >
      			<i class="material-icons">email</i><span>{l s='Subscribe' d='Shop.Theme.Actions'}</span>
      		</button>
          <div class="input-wrapper">
            <input
              name="email"
              type="text"
              value="{$value}"
              placeholder="{l s='Your email...' d='Shop.Forms.Labels'}"
              aria-labelledby="block-newsletter-label"
	      required
            >
          </div>
	  <input type="hidden" name="blockHookName" value="{$hookName}" />
          <input type="hidden" name="action" value="0">
          <div class="clearfix"></div>
        </div>
      </div>
    </form>
  </div>
</div>

