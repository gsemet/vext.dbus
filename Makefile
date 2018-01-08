.PHONY: build dist

all: dev test

dev:
	virtualenv --python python3 .venv
	. .venv/bin/activate && pip3 install -r requirements.txt -r requirements-dev.txt -e .

test:
	python -c "import dbus"

upload: clean
	. .venv/bin/activate && python setup.py sdist upload -r pypi

clean:
	rm -rfv build dist *.egg *.egg-info

sdist:
	. .venv/bin/activate && python setup.py sdist
