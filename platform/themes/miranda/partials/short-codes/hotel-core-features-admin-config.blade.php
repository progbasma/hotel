<div class="form-group">
    <label class="control-label">{{ __('Title') }}</label>
    <input
        class="form-control"
        name="title"
        type="text"
        value="{{ Arr::get($attributes, 'title') }}"
        placeholder="{{ __('Title') }}"
    >
</div>

<div class="form-group">
    <label class="control-label">{{ __('Subtitle') }}</label>
    <textarea
        class="form-control"
        name="subtitle"
        placeholder="{{ __('Subtitle') }}"
        rows="3"
    >{{ Arr::get($attributes, 'subtitle') }}</textarea>
</div>

<div class="form-group">
    <label class="control-label">{{ __('Button text') }}</label>
    <input
        class="form-control"
        name="button_text"
        type="text"
        value="{{ Arr::get($attributes, 'button_text') }}"
        placeholder="{{ __('Button text') }}"
    >
</div>

<div class="form-group">
    <label class="control-label">{{ __('Button URL') }}</label>
    <input
        class="form-control"
        name="button_url"
        type="text"
        value="{{ Arr::get($attributes, 'button_url') }}"
        placeholder="{{ __('Button URL') }}"
    >
</div>
